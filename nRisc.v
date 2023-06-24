`include "src/Somador.v"
`include "src/UnidadeControle.v"
`include "src/BancoDeRegistradores.v"
`include "src/ExtensorDeSinal.v"
`include "src/MUX2_3.v"
`include "src/MUX2_8.v"
`include "src/MUX3_3.v"
`include "src/MUX3_8.v"

module nRisc(Reset, Clock, InstrucaoLida, EnderecoDados, DadoEscrito, DadoLido);

    /* Externo ao Processador*/
    input Reset, Clock;

    /* Interligando Memorias de Instrucao e Dados ao nRisc */
    input [7:0] EnderecoInstrucao, InstrucaoLida;
    input [7:0] EnderecoDados, DadoEscrito, DadoLido;

    /* Sinais Unidade de Controle */
    wire PCWrite, RegOrg1, RegDst, RegWrite, Cond, Jump, MemWrite, MemRead, MemToReg, ALUSrc1;
    wire [1:0] ALUSrc2, ALUOp, JumpValue, RegOrg2;

    /* PC */
    wire [7:0] PCOut;

    /* Somadores */
    wire [7:0] ResultadoSomador1, ResultadoSomador2;

    /* Banco de Registradores */
    wire [7:0] DadoEscr, Dado1, Dado2;

    /* Extensor de Sinal */
    wire [7:0] ImediatoExtendido;

    /* MUX entradas Banco de Registradores */
    wire [2:0] SaidaMuxRegOrg1, SaidaMuxRegOrg2, SaidaMuxRegDst;

    MUX2_3 muxRegOrg1(.Entrada0(InstrucaoLida[5:3]), 
                      .Entrada1(3'b101), 
                      .Controle(RegOrg1), 
                      .Resultado(SaidaMuxRegOrg1)
                     );

    MUX3_3 muxRegOrg2(.Entrada0(InstrucaoLida[2:0]), 
                      .Entrada1({1'b0, InstrucaoLida[2:1]}), 
                      .Entrada2(3'b101), 
                      .Controle(RegOrg2), 
                      .Resultado(SaidaMuxRegOrg2)
                     );

    MUX2_3 muxRegDst(.Entrada0(InstrucaoLida[5:3]),
                     .Entrada1(3'b101),
                     .Controle(RegDst),
                     .Resultado(SaidaMuxRegDst)
                    );

    UnidadeControle unidadeControle (.Opcode(InstrucaoLida[7:6]), 
                                     .Funct(InstrucaoLida[2:0]), 
                                     .PCWrite(PCWrite), 
                                     .RegOrg1(RegOrg1), 
                                     .RegOrg2(RegOrg2), 
                                     .RegDst(RegDst), 
                                     .RegWrite(RegWrite), 
                                     .ALUSrc1(ALUSrc1), 
                                     .ALUSrc2(ALUSrc2), 
                                     .ALUOp(ALUOp), 
                                     .JumpValue(JumpValue), 
                                     .Cond(Cond), 
                                     .Jump(Jump), 
                                     .MenWrite(MenWrite), 
                                     .MenRead(MenRead), 
                                     .MenToReg(MemToReg)
                                    );

    BancoDeRegistradores bancoDeRegistradores(.RegLido1(SaidaMuxRegOrg1), 
                                              .RegLido2(SaidaMuxRegOrg2), 
                                              .RegEscr(SaidaMuxRegDst), 
                                              .DadoEscr(DadoEscr), 
                                              .Dado1(Dado1), 
                                              .Dado2(Dado2), 
                                              .RegWrite(RegWrite), 
                                              .Clock(Clock)
                                             );

    ExtensorDeSinal extensorDeSinal (.Entrada(InstrucaoLida[5:1]), 
                                     .Resultado(ImediatoExtendido)
                                    );
                                    
    Somador Somador1(.Entrada1(PCOut), 
                     .Entrada2(8'b11111111), 
                     .Resultado(ResultadoSomador1)
                    );

endmodule
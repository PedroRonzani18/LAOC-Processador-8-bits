`include "nRisc.v"
`include "src/MemoriaDados.v"
`include "src/MemoriaInstrucao.v"

module SimulacaoGeral;

    reg Clock, Reset;

    reg[15:0] counter;

    /* Memoria de Instrucao */
    wire[7:0] InstrucaoLida;

    /* Memoria de Dados */
    wire[7:0] EnderecoDados, DadoEscrito, DadoLido;

    MemoriaDados memoriaDados(.Endereco(EnderecoDados), 
                              .DadoEscr(DadoEscrito), 
                              .DadoLido(DadoLido), 
                              .MenWrite(nrisc.MemWrite), 
                              .MenRead(nrisc.MemRead), 
                              .Clock(Clock)
                             );

    MemoriaInstrucao memoriaInstrucao(.Endereco(nrisc.pc1.PC), 
                                      .Instrucao(InstrucaoLida), 
                                      .Clock(Clock)
                                     );

    nRisc nrisc(.Reset(Reset), 
                .Clock(Clock),
                .InstrucaoLida(InstrucaoLida), 
                .EnderecoDados(EnderecoDados), 
                .DadoEscrito(DadoEscrito), 
                .DadoLido(DadoLido)
               );
    
    integer i;

    initial begin
        nrisc.pc1.PC = 8'b00000000;
        Clock = 1;
        counter = 10;
        
        $readmemb("dados.txt", memoriaDados.Dados); //Leitura dos dados
        $readmemb("instrucoes.txt", memoriaInstrucao.Instrucoes); // leitura das instrucoes
    
        // for (i = 0; i <= 255; i = i + 1) begin
        //     $display("Valor[%0d]: %b", i, memoriaInstrucao.Instrucoes[i]);
        // end
        
    end

    initial begin
        $monitor("%0d | pc=%b | i=%b| sp=%b | rr=%b | r0=%b | r1=%b | r2=%b | r3=%b | ra=%b | %0d",
                  counter, 
                  nrisc.pc1.PC,
                  InstrucaoLida,
                  
                  nrisc.bancoDeRegistradores.BR[3'b111],
                  nrisc.bancoDeRegistradores.BR[3'b101],
                  nrisc.bancoDeRegistradores.BR[3'b000],
                  nrisc.bancoDeRegistradores.BR[3'b001],
                  nrisc.bancoDeRegistradores.BR[3'b010],
                  nrisc.bancoDeRegistradores.BR[3'b011],
                  nrisc.bancoDeRegistradores.BR[3'b110],
                  Clock);

        #500 $finish;
    end

    always begin
        //$display("Valor: %b", memoriaInstrucao.Instrucoes[nrisc.PCOut]);
        if(memoriaInstrucao.Instrucoes[nrisc.PCOut] == 8'b00000000)
            $finish;
         #1; Clock = ~Clock;
    end


    always@(posedge Clock)
    begin
        $display(" ");
    counter = counter + 1;
    end
	

endmodule
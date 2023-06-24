`include "nRisc.v"
`include "src/MemoriaDados.v"
`include "src/MemoriaInstrucao.v"

module SimulacaoGeral;

    reg Clock, Reset;

    /* Memoria de Instrucao */
    wire[7:0] EnderecoInstrucao, InstrucaoLida;

    /* Memoria de Dados */
    wire[7:0] EnderecoDados, DadoEscrito, DadoLido;

    nRisc nrisc(Reset, Clock, InstrucaoLida, EnderecoDados, DadoEscrito, DadoLido);
    MemoriaDados memoriaDados(EnderecoDados, DadoEscrito, DadoLido, nrisc.MemWrite, nrisc.MemRead, Clock);
    MemoriaInstrucao memoriaInstrucao(EnderecoInstrucao, InstrucaoLida, Clock);

    initial begin
        Clock = 1'b1;
        $monitor("Time=%0d Clock=%b", $time, Clock);
        #10 $finish;
    end

    always begin
        #1; Clock = ~Clock;
    end

endmodule
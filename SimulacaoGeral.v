`include "nRisc.v"
`include "src/MemoriaDados.v"
`include "src/MemoriaIntrucao.v"

module SimulacaoGeral;

    reg Clock, Reset;

    nRisc nrisc(Reset, Clock);

    initial begin
        Clock = 0;
        $display("RI=%b", nrisc.SaidaPC);
        #10 $finish;
    end

    always begin
        #1; Clock = ~Clock;
    end

endmodule
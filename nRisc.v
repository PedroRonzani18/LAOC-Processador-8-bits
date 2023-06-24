`include "src/Somador.v"

module nRisc(Reset, Clock);

    input Reset, Clock;

    wire [7:0] SaidaPC;
    wire [7:0] SaidaSomador1;

    wire [7:0] Instrucao;

    Somador somador1(SaidaPC, 8'b00000010, SaidaSomador1);

endmodule
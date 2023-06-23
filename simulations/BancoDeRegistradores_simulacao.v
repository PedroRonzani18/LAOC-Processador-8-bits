`include "../src/BancoDeRegistradores.v"

module BancoDeRegistradores_simulacao;

  reg [2:0] RegLido1, RegLido2, RegEscr;
  reg [3:0] i, j;
  reg [7:0] DadoEscr;
  reg RegWrite, Clock;
  wire [7:0] Dado1, Dado2;

  initial begin
    Clock <= 0;
  end

  initial begin
    $monitor("Time=%0d RegLido1=%b RegLido2=%b RegEscr=%b DadoEscr=%b Dado1=%b Dado2=%b RegWrite=%b Clock=%b",
    $time, RegLido1, RegLido2, RegEscr, DadoEscr, Dado1, Dado2, RegWrite, Clock);
    #50 $finish;
  end

  always begin
    #1 Clock <= 1;
    #1 Clock <= 0;
  end

  always begin

    for(i = 0; i < 8; i = i + 1) begin
      #2 RegEscr <= i;
         DadoEscr <= i+1;
         RegWrite <= 1;
    end

    for(j = 0; j < 8; j = j + 1) begin
      #2 RegLido1 <= j;
         RegLido2 <= j;
         RegWrite <= 0;
    end

  end

  BancoDeRegistradores BancoDeRegistradores1(RegLido1, RegLido2, RegEscr, DadoEscr, Dado1, Dado2, RegWrite, Clock);

endmodule
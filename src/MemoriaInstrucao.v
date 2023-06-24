module MemoriaInstrucao (Endereco, Instrucao, Clock);

  input [7:0] Endereco;
  input Clock;
  output reg [7:0] Instrucao;

  reg [7:0] Instrucoes [255:0];

  reg [8:0] i;

  initial begin
    for(i = 0; i < 256; i = i + 1) begin
      Instrucoes[i] <= 255 - i;
    end
  end

  always @(negedge Clock) begin
    Instrucao <= Instrucoes[Endereco];
  end

endmodule

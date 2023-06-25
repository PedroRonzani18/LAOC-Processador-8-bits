module MemoriaInstrucao (Endereco, Instrucao, Clock);

  input [7:0] Endereco;
  input Clock;
  output reg [7:0] Instrucao;

  reg [7:0] Instrucoes [255:0];

  always @(negedge Clock) begin
    Instrucao <= Instrucoes[Endereco];
  end

endmodule

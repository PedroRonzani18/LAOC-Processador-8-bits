module MemoriaInstrucao (Endereco, Instrucao, Clock);

  input [7:0] Endereco;
  input Clock;
  output reg [7:0] Instrucao;

  reg [7:0] Instrucoes [0:255];

  always @(negedge Clock) begin
    //$display("entrei: %b %b", Endereco, Instrucoes[Endereco]);
    Instrucao = Instrucoes[Endereco];
  end

endmodule

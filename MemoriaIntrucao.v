module MenoriaInstrucao (Endereco, Instrucao, Clock);

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

module MenoriaInstrucao_simulacao;

  reg [7:0] Endereco;
  reg Clock;
  wire [7:0] Instrucao;

  reg [8:0] i;
  
  initial begin
    Clock = 0;
  end

  initial begin
    $monitor("Time=%0d Endereco=%b Instrucao=%b Clock=%b",
    $time, Endereco, Instrucao, Clock);
  end

  always begin
    #1 Clock <= 1;
    #1 Clock <= 0;
  end

  always begin

    for(i = 0; i < 256; i = i + 1) begin
      #2 Endereco <= i;
    end

  end

  MenoriaInstrucao MenoriaInstrucao1(Endereco, Instrucao, Clock);

endmodule
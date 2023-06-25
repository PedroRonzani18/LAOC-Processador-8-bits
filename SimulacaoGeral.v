`include "nRisc.v"
`include "src/MemoriaDados.v"
`include "src/MemoriaInstrucao.v"

module SimulacaoGeral;

    reg Clock, Reset;

    /* Memoria de Instrucao */
    wire[7:0] InstrucaoLida;

    /* Memoria de Dados */
    wire[7:0] EnderecoDados, DadoEscrito, DadoLido;

    nRisc nrisc(.Reset(Reset), 
                .Clock(Clock),
                .InstrucaoLida(InstrucaoLida), 
                .EnderecoDados(EnderecoDados), 
                .DadoEscrito(DadoEscrito), 
                .DadoLido(DadoLido)
               );

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

    integer i;

    initial begin
        nrisc.pc1.PC = 8'b00000000;
        Clock = 0;
        
        $readmemb("dados.txt", memoriaDados.Dados); //Leitura dos dados
        $readmemb("instrucoes.txt", memoriaInstrucao.Instrucoes); // leitura das instrucoes
    
        // for (i = 0; i <= 255; i = i + 1) begin
        //     $display("Valor[%0d]: %b", i, memoriaInstrucao.Instrucoes[i]);
        // end
        
    end

    initial begin
        $monitor("Time=%0d inst=%b comp=%b out=%b clk=%0d",
                $time, InstrucaoLida, memoriaInstrucao.Instrucao, nrisc.pc1.PC, Clock);

        #70 $finish;
    end

    always begin
        //$display("Valor: %b", memoriaInstrucao.Instrucoes[nrisc.PCOut]);
        if(memoriaInstrucao.Instrucoes[nrisc.PCOut] == 8'b00000000)
            $finish;
         #1; Clock = ~Clock;
    end

endmodule
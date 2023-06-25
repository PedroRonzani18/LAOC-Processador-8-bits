`include "nRisc.v"
`include "src/MemoriaDados.v"
`include "src/MemoriaInstrucao.v"

module SimulacaoGeral;

    reg Clock, Reset;

    /* Memoria de Instrucao */
    wire[7:0] EnderecoInstrucao, InstrucaoLida;

    /* Memoria de Dados */
    wire[7:0] EnderecoDados, DadoEscrito, DadoLido;

    nRisc nrisc(.Reset(Reset), 
                .Clock(Clock),
                .EnderecoInstrucao(EnderecoInstrucao),
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

    MemoriaInstrucao memoriaInstrucao(.Endereco(EnderecoInstrucao), 
                                      .Instrucao(InstrucaoLida), 
                                      .Clock(Clock)
                                     );

    integer i;

    initial begin
        
        //$monitor("Time=%0d Clock=%b, i=%0d", $time, Clock, i);
        Clock = 0;

        for( i=0; i <= 255; i=i+1) begin
            memoriaDados.Dados[i]=0;//Inicializa a memória com 0

        end
        
        $readmemh("dados.txt", memoriaDados.Dados); //Leitura do arquivo
    
        #256 $finish;
        
    end

    always begin
        #1; Clock = ~Clock;
    end

endmodule
library verilog;
use verilog.vl_types.all;
entity MenoriaInstrucao is
    port(
        Endereco        : in     vl_logic_vector(7 downto 0);
        Instrucao       : out    vl_logic_vector(7 downto 0);
        Clock           : in     vl_logic
    );
end MenoriaInstrucao;

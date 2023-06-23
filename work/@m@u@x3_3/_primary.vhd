library verilog;
use verilog.vl_types.all;
entity MUX3_3 is
    port(
        Entrada0        : in     vl_logic_vector(2 downto 0);
        Entrada1        : in     vl_logic_vector(2 downto 0);
        Entrada2        : in     vl_logic_vector(2 downto 0);
        Controle        : in     vl_logic_vector(1 downto 0);
        Resultado       : out    vl_logic_vector(2 downto 0)
    );
end MUX3_3;

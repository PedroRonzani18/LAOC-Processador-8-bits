library verilog;
use verilog.vl_types.all;
entity MUX2_8 is
    port(
        Entrada0        : in     vl_logic_vector(7 downto 0);
        Entrada1        : in     vl_logic_vector(7 downto 0);
        Controle        : in     vl_logic;
        Resultado       : out    vl_logic_vector(7 downto 0)
    );
end MUX2_8;

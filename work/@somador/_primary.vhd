library verilog;
use verilog.vl_types.all;
entity Somador is
    port(
        Entrada1        : in     vl_logic_vector(7 downto 0);
        Entrada2        : in     vl_logic_vector(7 downto 0);
        Resultado       : out    vl_logic_vector(7 downto 0)
    );
end Somador;

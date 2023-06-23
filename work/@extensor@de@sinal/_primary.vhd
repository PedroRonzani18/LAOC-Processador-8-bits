library verilog;
use verilog.vl_types.all;
entity ExtensorDeSinal is
    port(
        Entrada         : in     vl_logic_vector(4 downto 0);
        Resultado       : out    vl_logic_vector(7 downto 0)
    );
end ExtensorDeSinal;

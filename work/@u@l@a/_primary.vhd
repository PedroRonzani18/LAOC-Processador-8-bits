library verilog;
use verilog.vl_types.all;
entity ULA is
    port(
        Entrada1        : in     vl_logic_vector(7 downto 0);
        Entrada2        : in     vl_logic_vector(7 downto 0);
        Zero            : out    vl_logic;
        Resultado       : out    vl_logic_vector(7 downto 0);
        ALUOp           : in     vl_logic_vector(1 downto 0)
    );
end ULA;

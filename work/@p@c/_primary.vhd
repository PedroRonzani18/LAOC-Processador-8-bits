library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        PCIn            : in     vl_logic_vector(7 downto 0);
        PCOut           : out    vl_logic_vector(7 downto 0);
        PCWrite         : in     vl_logic;
        Clock           : in     vl_logic
    );
end PC;

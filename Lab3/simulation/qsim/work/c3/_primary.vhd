library verilog;
use verilog.vl_types.all;
entity c3 is
    port(
        clk_50          : in     vl_logic;
        clr             : in     vl_logic;
        start           : in     vl_logic;
        \in\            : in     vl_logic_vector(2 downto 0);
        led             : out    vl_logic;
        \out\           : out    vl_logic_vector(3 downto 0)
    );
end c3;

library verilog;
use verilog.vl_types.all;
entity c2 is
    port(
        clk_50          : in     vl_logic;
        clr             : in     vl_logic;
        HEX0            : out    vl_logic_vector(6 downto 0);
        redNS           : out    vl_logic;
        yellowNS        : out    vl_logic;
        greenNS         : out    vl_logic;
        redEW           : out    vl_logic;
        yellowEW        : out    vl_logic;
        greenEW         : out    vl_logic;
        \out\           : out    vl_logic_vector(2 downto 0)
    );
end c2;

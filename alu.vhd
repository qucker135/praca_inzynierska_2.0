----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2022 21:25:22
-- Design Name: 
-- Module Name: alu - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( arg1 : in STD_LOGIC_VECTOR (7 downto 0);
           arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           op : in STD_LOGIC_VECTOR(4 downto 0);
           bbb : in STD_LOGIC_VECTOR (2 downto 0);
           curC : in STD_LOGIC;
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
end alu;

architecture Behavioral of alu is

    component add8 is
        Port ( arg1 : in STD_LOGIC_VECTOR (7 downto 0);
           arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component sub8 is
        Port ( arg1 : in STD_LOGIC_VECTOR (7 downto 0);
           arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component and8 is
        Port ( arg1 : in STD_LOGIC_VECTOR (7 downto 0);
           arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component ior8 is
        Port ( arg1 : in STD_LOGIC_VECTOR (7 downto 0);
           arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component xor8 is
        Port ( arg1 : in STD_LOGIC_VECTOR (7 downto 0);
           arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component not8 is
        Port ( arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component rlf8 is
        Port ( arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           curC : in STD_LOGIC;
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component rrf8 is
        Port ( arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           curC : in STD_LOGIC;
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component zero8 is
        Port ( res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component inc8 is
        Port ( arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component dec8 is
        Port ( arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component arg1_8 is
        Port ( arg1 : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component arg2_8 is
        Port ( arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component swap8 is
        Port ( arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component bc8 is
        Port ( arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           bbb : in STD_LOGIC_VECTOR (2 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component bs8 is
        Port ( arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           bbb : in STD_LOGIC_VECTOR (2 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component btc is
        Port ( arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           bbb : in STD_LOGIC_VECTOR (2 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component bts is
        Port ( arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           bbb : in STD_LOGIC_VECTOR (2 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    signal pom_res_add8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_add8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_sub8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_sub8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_and8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_and8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_ior8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_ior8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_xor8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_xor8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_not8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_not8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_rlf8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_rlf8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_rrf8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_rrf8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_zero8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_zero8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_inc8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_inc8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_dec8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_dec8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_arg1_8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_arg1_8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_arg2_8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_arg2_8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_swap8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_swap8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_bc8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_bc8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_bs8_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_bs8_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_btc_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_btc_sig : STD_LOGIC_VECTOR(2 downto 0);
    
    signal pom_res_bts_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal pom_flags_bts_sig : STD_LOGIC_VECTOR(2 downto 0);

begin

    u_add8: add8
    port map(
        arg1 => arg1,
        arg2 => arg2,
        res => pom_res_add8_sig,
        flags => pom_flags_add8_sig
    );
    
    u_sub8: sub8
    port map(
        arg1 => arg1,
        arg2 => arg2,
        res => pom_res_sub8_sig,
        flags => pom_flags_sub8_sig
    );
    
    u_and8: and8
    port map(
        arg1 => arg1,
        arg2 => arg2,
        res => pom_res_and8_sig,
        flags => pom_flags_and8_sig
    );
    
    u_ior8: ior8
    port map(
        arg1 => arg1,
        arg2 => arg2,
        res => pom_res_ior8_sig,
        flags => pom_flags_ior8_sig
    );
    
    u_xor8: xor8
    port map(
        arg1 => arg1,
        arg2 => arg2,
        res => pom_res_xor8_sig,
        flags => pom_flags_xor8_sig
    );
    
    u_not8: not8
    port map(
        arg2 => arg2,
        res => pom_res_not8_sig,
        flags => pom_flags_not8_sig
    );
    
    u_rlf8: rlf8
    port map(
        arg2 => arg2,
        curC => curC,
        res => pom_res_rlf8_sig,
        flags => pom_flags_rlf8_sig
    );
    
    u_rrf8: rrf8
    port map(
        arg2 => arg2,
        curC => curC,
        res => pom_res_rrf8_sig,
        flags => pom_flags_rrf8_sig
    );
    
    u_zero8: zero8
    port map(
        res => pom_res_zero8_sig,
        flags => pom_flags_zero8_sig
    );
    
    u_inc8: inc8
    port map(
        arg2 => arg2,
        res => pom_res_inc8_sig,
        flags => pom_flags_inc8_sig
    );
    
    u_dec8: dec8
    port map(
        arg2 => arg2,
        res => pom_res_dec8_sig,
        flags => pom_flags_dec8_sig
    );
    
    u_arg1_8: arg1_8
    port map(
        arg1 => arg1,
        res => pom_res_arg1_8_sig,
        flags => pom_flags_arg1_8_sig
    );
    
    u_arg2_8: arg2_8
    port map(
        arg2 => arg2,
        res => pom_res_arg2_8_sig,
        flags => pom_flags_arg2_8_sig
    );
    
    u_swap8: swap8
    port map(
        arg2 => arg2,
        res => pom_res_swap8_sig,
        flags => pom_flags_swap8_sig
    );
    
    u_bc8: bc8
    port map(
        arg2 => arg2,
        bbb => bbb,
        res => pom_res_bc8_sig,
        flags => pom_flags_bc8_sig
    );
    
    u_bs8: bs8
    port map(
        arg2 => arg2,
        bbb => bbb,
        res => pom_res_bs8_sig,
        flags => pom_flags_bs8_sig
    );
    
    u_btc: btc
    port map(
        arg2 => arg2,
        bbb => bbb,
        res => pom_res_btc_sig,
        flags => pom_flags_btc_sig
    );
    
    u_bts: bts
    port map(
        arg2 => arg2,
        bbb => bbb,
        res => pom_res_bts_sig,
        flags => pom_flags_bts_sig
    );
    
    process(op,
    pom_res_add8_sig, pom_flags_add8_sig,
    pom_res_sub8_sig, pom_flags_sub8_sig,
    pom_res_and8_sig, pom_flags_and8_sig,
    pom_res_ior8_sig, pom_flags_ior8_sig,
    pom_res_xor8_sig, pom_flags_xor8_sig,
    pom_res_not8_sig, pom_flags_not8_sig,
    pom_res_rlf8_sig, pom_flags_rlf8_sig,
    pom_res_rrf8_sig, pom_flags_rrf8_sig,
    pom_res_zero8_sig, pom_flags_zero8_sig,
    pom_res_inc8_sig, pom_flags_inc8_sig,
    pom_res_dec8_sig, pom_flags_dec8_sig,
    pom_res_arg1_8_sig, pom_flags_arg1_8_sig,
    pom_res_arg2_8_sig, pom_flags_arg2_8_sig,
    pom_res_swap8_sig, pom_flags_swap8_sig,
    pom_res_bc8_sig, pom_flags_bc8_sig,
    pom_res_bs8_sig, pom_flags_bs8_sig,
    pom_res_btc_sig, pom_flags_btc_sig,
    pom_res_bts_sig, pom_flags_bts_sig)
    begin
        case op is
            when "00000" | "00001" =>
                res <= pom_res_add8_sig;
                flags <= pom_flags_add8_sig;
            when "00010" | "00011" =>
                res <= pom_res_sub8_sig;
                flags <= pom_flags_sub8_sig;
            when "00100" | "00101" =>
                res <= pom_res_and8_sig;
                flags <= pom_flags_and8_sig;
            when "00110" | "00111" =>
                res <= pom_res_ior8_sig;
                flags <= pom_flags_ior8_sig;
            when "01000" | "01001" =>
                res <= pom_res_xor8_sig;
                flags <= pom_flags_xor8_sig;
            when "01010" | "01011" =>
                res <= pom_res_not8_sig;
                flags <= pom_flags_not8_sig;
            when "01100" | "01101" =>
                res <= pom_res_rlf8_sig;
                flags <= pom_flags_rlf8_sig;
            when "01110" | "01111" =>
                res <= pom_res_rrf8_sig;
                flags <= pom_flags_rrf8_sig;
            when "10000" | "10001" =>
                res <= pom_res_zero8_sig;
                flags <= pom_flags_zero8_sig;  
            when "10010" | "10011" =>
                res <= pom_res_inc8_sig;
                flags <= pom_flags_inc8_sig;
            when "10100" | "10101" =>
                res <= pom_res_dec8_sig;
                flags <= pom_flags_dec8_sig;
            when "10110" | "10111" =>
                res <= pom_res_arg1_8_sig;
                flags <= pom_flags_arg1_8_sig;
            when "11000" | "11001" => 
                res <= pom_res_arg2_8_sig;
                flags <= pom_flags_arg2_8_sig;
            when "11010" | "11011" => 
                res <= pom_res_swap8_sig;
                flags <= pom_flags_swap8_sig;
            when "11100" => 
                res <= pom_res_bc8_sig;
                flags <= pom_flags_bc8_sig;
            when "11101" =>
                res <= pom_res_bs8_sig;
                flags <= pom_flags_bs8_sig;
            when "11110" =>
                res <= pom_res_btc_sig;
                flags <= pom_flags_btc_sig;
            when "11111" => 
                res <= pom_res_bts_sig;
                flags <= pom_flags_bts_sig;
            when others =>
                res <= (others => '-');
                flags <= (others => '-');
        end case;
    end process;

end Behavioral;

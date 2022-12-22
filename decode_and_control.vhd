----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2022 19:40:03
-- Design Name: 
-- Module Name: decode_and_control - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decode_and_control is
    Port ( clk : in STD_LOGIC;
           ir_in : in STD_LOGIC_VECTOR (13 downto 0);
           z_flag : in STD_LOGIC;
           ir_rst : out STD_LOGIC;
           we_ir : out STD_LOGIC;
           we_reg_file : out STD_LOGIC;
           we_wreg : out STD_LOGIC;
           we_flags : out STD_LOGIC_VECTOR (2 downto 0);
           addrmux_s : out STD_LOGIC;
           datamux_s : out STD_LOGIC;
           alu_op : out STD_LOGIC_VECTOR (4 downto 0);
           stack_enable : out STD_LOGIC;
           stack_push_pop : out STD_LOGIC;
           str_k_to_pc : out STD_LOGIC;
           str_pc_from_stack : out STD_LOGIC;
           gie_set : out STD_LOGIC;
           pre_wreg_mux_retlw_s : out STD_LOGIC;
           we_flags_caching_reg : out STD_LOGIC;
           str_inc_pc : out STD_LOGIC);
end decode_and_control;

architecture Behavioral of decode_and_control is

    type clock_phase is (Q1, Q2, Q3, Q4);

    signal clock_phase_s : clock_phase := Q1;

begin

    process(clk)
    begin
        case to_integer(unsigned(ir_in)) is
            when 16#700# to 16#7FF# => --ADDWF
                datamux_s <= '1';
                alu_op <= "00000"; -- ALU_ADD
                stack_push_pop <= '-';
                pre_wreg_mux_retlw_s <= '0';
                case clock_phase_s is
                    when Q1 =>
                        clock_phase_s <= Q2;
                        ir_rst <= '0';
                        we_ir <= '1';
                        we_reg_file <= '0';
                        we_wreg <= '0';
                        we_flags <= B"000";
                        stack_enable <= '0';
                        str_k_to_pc <= '0';
                        str_pc_from_stack <= '0';
                        gie_set <= '0';
                        we_flags_caching_reg <= '0';
                        str_inc_pc <= '1';
                    when Q2 =>
                        clock_phase_s <= Q3;
                    when Q3 =>
                        clock_phase_s <= Q4;
                    when Q4 =>
                        clock_phase_s <= Q1;
                end case;
            when others => -- NOP (TODO)
                datamux_s <= '0';
                alu_op <= "00000"; -- ALU_ADD
                stack_push_pop <= '-';
                pre_wreg_mux_retlw_s <= '0';

                case clock_phase_s is
                    when Q1 =>
                        clock_phase_s <= Q2;
                        ir_rst <= '0';
                        we_ir <= '0';
                        we_reg_file <= '0';
                        we_wreg <= '0';
                        we_flags <= B"000";
                        stack_enable <= '0';
                        str_k_to_pc <= '0';
                        str_pc_from_stack <= '0';
                        gie_set <= '0';
                        we_flags_caching_reg <= '0';
                        str_inc_pc <= '0';
                    when Q2 =>
                        clock_phase_s <= Q3;
                    when Q3 =>
                        clock_phase_s <= Q4;
                    when Q4 =>
                        clock_phase_s <= Q1;
                end case;
                
        end case;
    end process;

    addrmux_s <= '0' when ir_in(6 downto 0) = B"000_0000" else '1';

end Behavioral;

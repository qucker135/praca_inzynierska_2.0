----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.12.2022 15:38:15
-- Design Name: 
-- Module Name: st_mch_test1 - Behavioral
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

entity st_mch_test2 is
    Port ( clk : in STD_LOGIC;
           ir_in : out STD_LOGIC_VECTOR (7 downto 0);
           we_ir : out STD_LOGIC;
           f_in : out STD_LOGIC_VECTOR (7 downto 0);
           we_f : out STD_LOGIC;
           mux_s : out STD_LOGIC;
           alu_op : out STD_LOGIC_VECTOR (4 downto 0);
           alu_bbb : out STD_LOGIC_VECTOR (2 downto 0);
           alu_curC : out STD_LOGIC;
           we_wreg : out STD_LOGIC;
           we_flags : out STD_LOGIC;
           addr_in : out STD_LOGIC_VECTOR(8 downto 0);
           value_from_stack : out STD_LOGIC_VECTOR(12 downto 0);
           str_from_stack : out STD_LOGIC;
           value_k_to_pc : out STD_LOGIC_VECTOR(10 downto 0);
           str_k_to_pc : out STD_LOGIC;
           str_inc_pc : out STD_LOGIC;
           gie_set : out STD_LOGIC;
           status_flags : out STD_LOGIC_VECTOR(2 downto 0);
           we_status_flags : out STD_LOGIC_VECTOR(2 downto 0));
end st_mch_test2;

architecture Behavioral of st_mch_test2 is

    type clock_phase is (Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30);
    
    signal clock_phase_s : clock_phase := Q1;

begin

    process(clk)
    begin
        if rising_edge(clk) then
            case clock_phase_s is
                when Q1 => 
                    clock_phase_s <= Q2;
                    ir_in <= X"D1";
                    we_ir <= '1';
                    f_in <= X"23";
                    we_f <= '1';
                    mux_s <= '0';
                    alu_op <= "00000";
                    alu_bbb <= "000";
                    alu_curC <= '1';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"0_0000_0000";
                    value_from_stack <= B"0_0000_0000_0000";
                    str_from_stack <= '0';
                    value_k_to_pc <= B"000_0000_0000";
                    str_k_to_pc <= '0';
                    str_inc_pc <= '0';
                    gie_set <= '0';
                    status_flags <= B"000";
                    we_status_flags <= B"000";
                when Q2 => 
                    clock_phase_s <= Q3;
                    ir_in <= X"FE";
                    we_ir <= '1';
                    f_in <= X"01";
                    we_f <= '1';
                    mux_s <= '1';
                    alu_op <= "00010";
                    alu_bbb <= "000";
                    alu_curC <= '0';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"0_0000_0011";
                when Q3 => 
                    clock_phase_s <= Q4;
                    ir_in <= X"45";
                    we_ir <= '1';
                    f_in <= X"02";
                    we_f <= '1';
                    mux_s <= '0';
                    alu_op <= "00100";
                    alu_bbb <= "000";
                    alu_curC <= '1';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"0_0000_0001";
                when Q4 => 
                    clock_phase_s <= Q5;
                    ir_in <= X"12";
                    we_ir <= '0';
                    f_in <= X"14";
                    we_f <= '1';
                    mux_s <= '1';
                    alu_op <= "00110";
                    alu_bbb <= "101";
                    alu_curC <= '1';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"0_0000_0000";
                when Q5 => 
                    clock_phase_s <= Q6;
                    ir_in <= X"87";
                    we_ir <= '1';
                    f_in <= X"73";
                    we_f <= '1';
                    mux_s <= '0';
                    alu_op <= "01000";
                    alu_bbb <= "000";
                    alu_curC <= '0';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"0_0000_0010";
                when Q6 => 
                    clock_phase_s <= Q7;
                    ir_in <= X"AB";
                    we_ir <= '1';
                    f_in <= X"CD";
                    we_f <= '1';
                    mux_s <= '0';
                    alu_op <= "01010";
                    alu_bbb <= "000";
                    alu_curC <= '1';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"0_0000_0011";
                when Q7 => 
                    clock_phase_s <= Q8;
                    ir_in <= X"19";
                    we_ir <= '1';
                    f_in <= X"30";
                    we_f <= '1';
                    mux_s <= '1';
                    alu_op <= "01100";
                    alu_bbb <= "000";
                    alu_curC <= '1';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"0_0000_0001";
                when Q8 => 
                    clock_phase_s <= Q9;
                    ir_in <= X"1E";
                    we_ir <= '1';
                    f_in <= X"78";
                    we_f <= '1';
                    mux_s <= '1';
                    alu_op <= "01110";
                    alu_bbb <= "000";
                    alu_curC <= '0';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"0_0000_0011";
                 when Q9 => 
                    clock_phase_s <= Q10;
                    ir_in <= X"FB";
                    we_ir <= '1';
                    f_in <= X"A5";
                    we_f <= '1';
                    mux_s <= '1';
                    alu_op <= "10000";
                    alu_bbb <= "000";
                    alu_curC <= '1';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"0_1010_0011";
                when Q10 => 
                    clock_phase_s <= Q11;
                    ir_in <= X"8D";
                    we_ir <= '1';
                    f_in <= X"54";
                    we_f <= '1';
                    mux_s <= '0';
                    alu_op <= "10010";
                    alu_bbb <= "000";
                    alu_curC <= '1';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"1_0101_1110";
                when Q11 => 
                    clock_phase_s <= Q12;
                    ir_in <= X"8A";
                    we_ir <= '1';
                    f_in <= X"00";
                    we_f <= '1';
                    mux_s <= '1';
                    alu_op <= "10100";
                    alu_bbb <= "000";
                    alu_curC <= '1';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"0_1000_1101";
                when Q12 => 
                    clock_phase_s <= Q13;
                    ir_in <= X"0F";
                    we_ir <= '1';
                    f_in <= X"43";
                    we_f <= '1';
                    mux_s <= '1';
                    alu_op <= "10110";
                    alu_bbb <= "000";
                    alu_curC <= '1';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"0_1100_0010";
                when Q13 => 
                    clock_phase_s <= Q14;
                    ir_in <= X"AC";
                    we_ir <= '1';
                    f_in <= X"5B";
                    we_f <= '1';
                    mux_s <= '0';
                    alu_op <= "11000";
                    alu_bbb <= "000";
                    alu_curC <= '1';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"0_0001_0001";
                when Q14 => 
                    clock_phase_s <= Q15;
                    ir_in <= X"38";
                    we_ir <= '1';
                    f_in <= X"CA";
                    we_f <= '1';
                    mux_s <= '0';
                    alu_op <= "11010";
                    alu_bbb <= "000";
                    alu_curC <= '1';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"0_1010_1111";
                when Q15 => 
                    clock_phase_s <= Q16;
                    ir_in <= X"03";
                    we_ir <= '1';
                    f_in <= X"84";
                    we_f <= '1';
                    mux_s <= '1';
                    alu_op <= "11100";
                    alu_bbb <= "011";
                    alu_curC <= '1';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"0_1010_0000";
                when Q16 => 
                    clock_phase_s <= Q17;
                    ir_in <= X"D5";
                    we_ir <= '1';
                    f_in <= X"9A";
                    we_f <= '1';
                    mux_s <= '1';
                    alu_op <= "11101";
                    alu_bbb <= "110";
                    alu_curC <= '1';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"0_1010_1111";
                when Q17 => 
                    clock_phase_s <= Q18;
                    ir_in <= X"6A";
                    we_ir <= '1';
                    f_in <= X"75";
                    we_f <= '1';
                    mux_s <= '0';
                    alu_op <= "11110";
                    alu_bbb <= "010";
                    alu_curC <= '1';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"1_1100_1010";
                when Q18 => 
                    clock_phase_s <= Q19;
                    ir_in <= X"2C";
                    we_ir <= '1';
                    f_in <= X"3D";
                    we_f <= '1';
                    mux_s <= '1';
                    alu_op <= "11111";
                    alu_bbb <= "001";
                    alu_curC <= '1';
                    we_wreg <= '1';
                    we_flags <= '1';
                    addr_in <= B"1_0110_1001";
                when Q19 =>
                    -- GIE SET TEST
                    clock_phase_s <= Q20;
                    value_from_stack <= B"0_0000_0000_0000";
                    str_from_stack <= '0';
                    value_k_to_pc <= B"000_0000_0000";
                    str_k_to_pc <= '0';
                    str_inc_pc <= '0';
                    gie_set <= '1';
                    status_flags <= B"000";
                    we_status_flags <= B"000";
                when Q20 =>
                    clock_phase_s <= Q21;
                    addr_in <= B"0_0000_1011";
                    value_from_stack <= B"0_0000_0000_0000";
                    str_from_stack <= '0';
                    value_k_to_pc <= B"000_0000_0000";
                    str_k_to_pc <= '0';
                    str_inc_pc <= '0';
                    gie_set <= '0';
                    status_flags <= B"000";
                    we_status_flags <= B"000";
                when Q21 =>
                    -- FLAGS TESTS
                    clock_phase_s <= Q22;
                    value_from_stack <= B"0_0000_0000_0000";
                    str_from_stack <= '0';
                    value_k_to_pc <= B"000_0000_0000";
                    str_k_to_pc <= '0';
                    str_inc_pc <= '0';
                    gie_set <= '0';
                    status_flags <= B"100";
                    we_status_flags <= B"111";
                when Q22 =>
                    -- GOTO & CALL TESTS
                    clock_phase_s <= Q23;
                    value_from_stack <= B"0_0000_0000_0000";
                    str_from_stack <= '0';
                    value_k_to_pc <= B"010_0111_1001";
                    str_k_to_pc <= '1';
                    str_inc_pc <= '0';
                    gie_set <= '0';
                    status_flags <= B"000";
                    we_status_flags <= B"000";
                when Q23 =>
                    -- PC INC TEST
                    clock_phase_s <= Q24;
                    value_from_stack <= B"0_0000_0000_0000";
                    str_from_stack <= '0';
                    value_k_to_pc <= B"010_0111_1001";
                    str_k_to_pc <= '0';
                    str_inc_pc <= '1';
                    gie_set <= '0';
                    status_flags <= B"000";
                    we_status_flags <= B"000";
                when Q24 =>
                    clock_phase_s <= Q25;
                when Q25 => 
                    clock_phase_s <= Q26;
                when Q26 =>
                    -- RET** TESTS
                    clock_phase_s <= Q27;
                    value_from_stack <= B"1_0111_1001_0110";
                    str_from_stack <= '1';
                    value_k_to_pc <= B"000_0000_0000";
                    str_k_to_pc <= '0';
                    str_inc_pc <= '0';
                    gie_set <= '0';
                    status_flags <= B"000";
                    we_status_flags <= B"000";
                when Q27 =>
                    clock_phase_s <= Q28;
                    value_from_stack <= B"1_0111_1001_0110";
                    str_from_stack <= '0';
                    value_k_to_pc <= B"000_0000_0000";
                    str_k_to_pc <= '0';
                    str_inc_pc <= '1';
                    gie_set <= '0';
                    status_flags <= B"000";
                    we_status_flags <= B"000";
                when Q28 =>
                    clock_phase_s <= Q29;
                when Q29 =>
                    clock_phase_s <= Q30;
                when Q30 =>
                    clock_phase_s <= Q1;
                    value_from_stack <= B"0_0000_0000_0000";
                    str_from_stack <= '0';
                    value_k_to_pc <= B"000_0000_0000";
                    str_k_to_pc <= '0';
                    str_inc_pc <= '0';
                    gie_set <= '0';
                    status_flags <= B"000";
                    we_status_flags <= B"000";
            end case;
        end if;
    end process;

end Behavioral;

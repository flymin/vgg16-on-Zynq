webtalk_init -webtalk_dir /home/class18/gaoruiyuan/vgg16/vgg16.sim/mult_sim/behav/xsim/xsim.dir/mult_sim_behav/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Mon Jan 14 09:39:14 2019" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "XSIM v2018.1 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2188600" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "LIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "xsim_vivado" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "12e7bbcf-1f91-4a71-b26a-d3bf2dc19549" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "a64037face8c45728ae49ad627960594" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "14" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "RedHatEnterpriseServer" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Red Hat Enterprise Linux Server release 6.6 (Santiago)" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Xeon(R) CPU E5-2650 v2 @ 2.60GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "2600.069 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "2" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "271.000 GB" -context "user_environment"
webtalk_register_client -client xsim
webtalk_add_data -client xsim -key Command -value "xsim" -context "xsim\\command_line_options"
webtalk_add_data -client xsim -key trace_waveform -value "true" -context "xsim\\usage"
webtalk_add_data -client xsim -key runtime -value "1 us" -context "xsim\\usage"
webtalk_add_data -client xsim -key iteration -value "1" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Time -value "0.02_sec" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Memory -value "130244_KB" -context "xsim\\usage"
webtalk_transmit -clientid 2045977745 -regid "" -xml /home/class18/gaoruiyuan/vgg16/vgg16.sim/mult_sim/behav/xsim/xsim.dir/mult_sim_behav/webtalk/usage_statistics_ext_xsim.xml -html /home/class18/gaoruiyuan/vgg16/vgg16.sim/mult_sim/behav/xsim/xsim.dir/mult_sim_behav/webtalk/usage_statistics_ext_xsim.html -wdm /home/class18/gaoruiyuan/vgg16/vgg16.sim/mult_sim/behav/xsim/xsim.dir/mult_sim_behav/webtalk/usage_statistics_ext_xsim.wdm -intro "<H3>XSIM Usage Report</H3><BR>"
webtalk_terminate

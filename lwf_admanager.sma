/* Plugin generated by AMXX-Studio */

#include <amxmodx>

new const Messages_Lang[][] = 
{
	"PRINT_AD_MESSAGE_1",
	"PRINT_AD_MESSAGE_2",
	"PRINT_AD_MESSAGE_3",
	"PRINT_AD_MESSAGE_4",
	"PRINT_AD_MESSAGE_5",
	"PRINT_AD_MESSAGE_6",
	"PRINT_AD_MESSAGE_7",
	"PRINT_AD_MESSAGE_8",
	"PRINT_AD_MESSAGE_9",
	"PRINT_AD_MESSAGE_10",
	"PRINT_AD_MESSAGE_11",
	"PRINT_AD_MESSAGE_12"
}

new temp = 0;
new total_messages = sizeof Messages_Lang;

public plugin_init()
{
	register_plugin("CSGO-System: Print Messages", "1.1", "OsweRRR;")
	
	set_task(30.0, "pfn_ShowMessages", .flags="b")
	register_dictionary("lwf_admanager.txt")
}

public pfn_ShowMessages()
{
	client_print_color(0, print_team_default, "^1[^4CTF^1] %L", LANG_PLAYER, Messages_Lang[temp++])
	
	if(temp == total_messages)
	{
		temp = 0
	}
}
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang8202\\ f0\\ fs16 \n\\ par }
*/

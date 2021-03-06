/* Plugin generated by AMXX-Studio */

#include <amxmodx>
#include <fakemeta>
#include <jctf>

native Float:halflife_time()

new Float:fPtime[MAX_PLAYERS]
new bool:buyed[MAX_PLAYERS]

public plugin_init() 
{
	register_forward(FM_AddToFullPack, "AddToFullPack", 1)
	register_event_ex("DeathMsg", "Ev_ClientDeath", RegisterEvent_Global)
	shop_add_item("MENU_SPITEMS_OP_1", 90, "buy_invisibility")
}

public client_disconnected(id)
{
	buyed[id] = false
}

public buy_invisibility(id)
{
	if(buyed[id])
	{
		client_print(id, print_chat, "No puedes comprar este item nuevamente mientras esta en uso.")
		return PLUGIN_HANDLED
	}
	
	fPtime[id] = halflife_time() + 20.0
	buyed[id] = true
	client_print(id, print_chat, "Has comprado invisibilidad por 20 segundos.")
	
	return PLUGIN_CONTINUE
}

public AddToFullPack(es, e, ent, host, flags, player, set)
{
	if(!player)
	{
		return
	}
	
	if(buyed[ent])
	{
		set_es(es, ES_Effects, EF_NODRAW)
		client_print(ent, print_center, "Invisibilidad: %0.1f segundo%s", fPtime[ent] - halflife_time(), (fPtime[ent] - halflife_time() > 1.9 ? "s" : ""))
		if(halflife_time() >= fPtime[ent] - 0.1)
		{
			client_print(ent, print_chat, "Se te han acabado los 20 segundos de invisibilidad.")
			buyed[ent] = false
		}
	}
}

public Ev_ClientDeath()
{
	new v = read_data(2)
	
	if(buyed[v])
	{
		buyed[v] = false
		client_print(v, print_chat, "Moriste y perdiste la invisibilidad.")
	}
}

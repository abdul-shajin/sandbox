module Rule
	RULES =  {
      "helpdesk-support/servers" => [

        "helpdesk-support/tickets-per-month",
        'helpdesk-support/team'
      ],
      "helpdesk-support/tickets-per-month" => [
      	"helpdesk-support/servers"
      ]
      
      # 'helpdesk-support/helpdesk-tickets' => [

      # ]

	}
end

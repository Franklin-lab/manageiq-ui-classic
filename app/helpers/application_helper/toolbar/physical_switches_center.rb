class ApplicationHelper::Toolbar::PhysicalSwitchesCenter < ApplicationHelper::Toolbar::Basic
  button_group(
    'physical_switch_vmdb',
    [
      select(
        :physical_switch_vmdb_choice,
        'fa fa-cog fa-lg',
        t = N_('Configuration'),
        t,
        :items => [
          button(
            :physical_switch_refresh,
            'fa fa-refresh fa-lg',
            N_('Refresh relationships and power states for all items related to these Physical Switches'),
            N_('Refresh Relationships and Power States'),
            :data    => {'function'      => 'sendDataWithRx',
                         'function-data' => '{"type": "refresh", "controller": "toolbarActions", "payload": {"entity": "physical_switches"}}'},
            :confirm => N_("Refresh relationships and power states for all items related to these Physical Switches?"),
            :enabled => false,
            :onwhen  => "1+",
            :options => {:feature => :refresh}
          ),
        ]
      ),
    ]
  )

  button_group(
    'physical_switches_operations',
    [
      select(
        :physical_switches_power_choice,
        'fa fa-power-off fa-lg',
        N_('Power Functions'),
        N_('Power'),
        :items => [
          button(
            :physical_switch_restart,
            nil,
            N_('Restart the selected switches'),
            N_('Restart'),
            :icon    => "pficon pficon-restart fa-lg",
            :data    => {
              'function'      => 'sendDataWithRx',
              'function-data' => '{"type": "restart", "controller": "toolbarActions", "payload": {"entity": "physical_switches"}}'
            },
            :confirm => N_("Restart the selected switches?"),
            :enabled => false,
            :onwhen  => "1+",
            :options => {:feature => :restart}
          ),
        ]
      ),
    ]
  )
end
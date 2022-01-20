Before do
  window = Capybara.current_session.current_window
  window.maximize

  @page = lambda do |klass|
    klass.new
  end    

  Faker::Config.locale = 'pt-BR'
end

def exception_message(scn)
  scene = scn.failed?
  return unless scene == true

  log("\n\n----------------------------------------------")
  log('Reason:')
  log(scn.exception.message.to_s)
  log("----------------------------------------------\n\n")
end

After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')

  if scenario.failed?
    take_screenshot(scenario_name.downcase!, 'falhou')
  else
    take_screenshot(scenario_name.downcase!, 'passou')
  end
end

#configuracao para exibicao do terminal, pode usar em qql projeto
AfterConfiguration do |config|
  config.on_event(:test_case_finished) do |event|
    puts "\n----------------------------------------------"
    puts 'Results:'
    puts " - Scenario...: #{event.test_case.name}"
    puts " - The results is: #{event.result}"
    puts "----------------------------------------------\n"
  end
end

# configuracao do report builder, apos finalizacao de tudo
at_exit do
  @infos = {
    'Browser' => Capybara.default_driver.to_s.capitalize,
    'Environment' => ENV['ENV_TYPE'],
    'Data do Teste' => Time.now.strftime('%d/%B/%Y'),
    'Hora do Teste' => time = Time.now.strftime('%H:%M:%S')
  }
  ReportBuilder.configure do |config|
    config.input_path = 'report/report.json'
    config.report_path = 'report/report'
    config.report_types = [:html]
    config.include_images = true
    config.report_title = 'Estudo Ruby'
    config.additional_info = @infos
    config.color = 'indigo'
  end
  ReportBuilder.build_report
end
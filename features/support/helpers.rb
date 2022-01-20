module Helpers
  include Capybara::DSL

  def take_screenshot(scenario, result)
    folder_path = "report/screenshots/test_#{result}"
    imagem = "#{folder_path}/#{scenario}.png"
    page.save_screenshot(imagem)
    attach(imagem, 'image/png')
    # date = Time.now.strftime('%d/%B/%Y')
    # time = Time.now.strftime('%HH%MM%SS')
    # scn_name = scenario.name.gsub(%r{([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)}, '_')
    # screenshot = if scenario.failed?
    #     "#{Dir.pwd}/report/screenshots/failure/#{date}/#{scn_name}/#{time}.png"
    #   else
    #     "#{Dir.pwd}/report/screenshots/success/#{date}/#{scn_name}/#{time}.png"
    #   end
    # screenshot = screenshot.tr!(' ', '_') if screenshot.include?(' ')
    # page.save_screenshot(screenshot)
    # attach(screenshot, 'image/png')
  end 
end


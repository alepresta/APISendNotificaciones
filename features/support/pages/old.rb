
def line
  puts "-------------------------------------------------------------------------------".blue
end
def browser_MiArgentina
  @browser.get "https://id.argentina.gob.ar/"
end

def browser_MiArgentina_qa
  @browser.get "https://qa-mi.argentina.gob.ar/"
end

def passed
  puts "......[PASSED]".green
end
def image_text
  if image.text.length == 0
    puts "El panel superior es un: <Element_Imagen> "" [OK] "
  else
    puts "El contenido del link es: #{image.text}"
  end
end
def restarter_error
  puts "SE VERIFICA QUE ESTA REDIRECCIONANDO AL LUGAR INDICADO " "......[PASSED]".green
end
def restarter_error_r
  "¡¡¡¡¡ NO ESTA REDIRECCIONANDO AL LUGAR INDICADO !!!!! TENDRIA QUE ENCONTRAR: EN LA PÁGINA"
end

def passed_ok
  "......[PASSED]".green
end

def ifi
  if @nuevo_browser.include? @titlulo
    restarter_error
  else
    fail restarter_error_r
  end
end

def miArgentina_cerrar
  @browser.close
end

def esta_este_elemento(clase, elemento)
  @browser.manage.timeouts.implicit_wait = 0
  result = @browser.find_elements(clase, elemento).size() > 0
  if result
    result = @browser.find_element(clase, elemento).displayed?
  end
  @browser.manage.timeouts.implicit_wait = 30
  return result
end

def captura_elemento(clase,elemento)
  @browser.find_element(clase, elemento)
end

def logueo(cuit,usuario_nombre,psw)
  browser_MiArgentina_qa
  usuario = @browser.find_element(:id, 'id_number')
  usuario.send_keys cuit
  continuar =  @browser.find_element(:class, "loginCuilSession")
  continuar.click
  contrasena = @browser.find_element(:id, 'id_number')
  contrasena.send_keys psw
  continuado =  @browser.find_element(:class, "loginCuilSession")
  continuado.click
  nombre_de_clase = @browser.find_element(:xpath, "/html/body/main/section[1]/div[2]/div/h1")
  txtesto =  nombre_de_clase.text
  puts txtesto
  if txtesto.include? usuario_nombre
    puts "El ingreso para #{usuario_nombre} es correcto...[PASSED]".green
  else
    fail puts "El ingreso para #{usuario_nombre} es incorrecto...[ERROR]".red
  end
end

def capturar(x,y)
  @browser.find_element(x,y)
end


def esIgual(texto_que_deberia_estar, texto_capturado, imprime)
  if texto_que_deberia_estar.eql?(texto_capturado)
    text = true
    puts " #{imprime} ...[PASSED]"
  else
    if texto_capturado.include? texto_que_deberia_estar
      text = true
      puts " #{imprime} ...[PASSED]"
    else
      text = false
      fail puts " #{imprime}...[ERROR]"
    end
  end
  return text
end


def link_css_selector(css,link_que_deberia_ser)
  link_real = css.attribute("href")
  link_con_texto = css.text
  link_con_texto = link_con_texto.gsub('Abrir vínculo en nueva pestaña','')
  if link_que_deberia_ser.eql?(link_real)
    linksqs = true
    puts " #{link_con_texto}: lleva a...(#{link_real})...[PASSED]"
  else
    if link_real.include? link_que_deberia_ser
      linksqs = true
      puts " #{link_con_texto}: lleva a...(#{link_real})...[PASSED]"
    else
      linksqs = false
      fail puts " #{link_con_texto}: NO lleva a...(#{link_real})...[ERROR]"
    end
  end
  return linksqs
end

def donde_estoy
  puts @browser.current_url
end


def windows
  pestanias = @browser.window_handles
  puts pestanias
end

def windowsGO(pestania)
  @browser.switch_to.window(pestania)

end

def contar(css1, n_max)
  maxlength =  css1.attribute("maxlength")
  maxlength = maxlength.to_i
  name_prefijo =  css1.attribute("name")
  if maxlength > 0 and maxlength <= n_max
    puts " #{name_prefijo} debe ser maxlength = (#{n_max}):  el maxlength es = #{maxlength}...[PASSED]"
  else
    puts " #{name_prefijo} debe ser maxlength = (#{n_max}):   el maxlength es = #{maxlength}...[ERROR]".red
  end
end


def esradio?(css,tipo)
  atributo_donante = css.attribute("type")
  name_prefijo =  css.attribute("name")
  if atributo_donante == tipo
    puts "Campo #{name_prefijo} es tipo: \"#{atributo_donante}\". Debe ser del tipo: \"#{tipo}\"...[PASSED]"
  else
    puts "Campo #{name_prefijo} es tipo: \"#{atributo_donante}\". Debe ser del tipo: \"#{tipo}\"...[ERROR]".red
  end
end

def atributo(css,type,resultado_esperado_del_type)
  atributo_donante = css.attribute(type)
  name_prefijo =  css.attribute("name")
  if atributo_donante == resultado_esperado_del_type
    puts "Campo #{name_prefijo} es tipo: \"#{atributo_donante}\". Debe ser del tipo: \"#{resultado_esperado_del_type}\"...[PASSED]"
  else
    puts "Campo #{name_prefijo} es tipo: \"#{atributo_donante}\". Debe ser del tipo: \"#{resultado_esperado_del_type}\"...[ERROR]".red
  end
end

def esperar
  @browser.manage.timeouts.implicit_wait = 3
end
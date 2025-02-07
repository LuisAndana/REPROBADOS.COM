$PSVersionTable
$mensaje = if (Test-Path $path)  { "path existe" } else { "path no encontrado" }
write-Output $mensaje

switch (3)
{
    1 {"[$_] es uno."}
    2 {"[$_] es dos."}
    3 {"[$_] es tres."}
    4 {"[$_] es cuatro."}
}

switch (3)
{
    1 {"[$_] es uno."}
    2 {"[$_] es dos."}
    3 {"[$_] es tres."}
    4 {"[$_] es cuatro."}
    3 {"[$_] tres de nuevo."}
}

switch (3)
{
    1 {"[$_] es uno."}
    2 {"[$_] es dos."}
    3 {"[$_] es tres."; Break}
    4 {"[$_] es cuatro."}
    3 {"[$_] tres de nuevo."}
}

switch (1,5)
{
    1 {"[$_] es uno."}
    2 {"[$_] es dos."}
    3 {"[$_] es tres."}
    4 {"[$_] es cuatro."}
    5 {"[$_] es cinco."}
}

switch ("seis")
{
    1 {"[$_] es uno." ; Break}
    2 {"[$_] es dos." ; Break}
    3 {"[$_] es tres."; Break}
    4 {"[$_] es cuatro." ; Break}
    5 {"[$_] tres de nuevo." ; Break}
    "se*" {"[$_] coincide con se*."}
    Default{
            "No hay coincidencias con [$_]"
           } 
}

switch -Wildcard("seis")
{
    1 {"[$_] es uno." ; Break}
    2 {"[$_] es dos." ; Break}
    3 {"[$_] es tres."; Break}
    4 {"[$_] es cuatro." ; Break}
    5 {"[$_] tres de nuevo." ; Break}
    "se*" {"[$_] coincide con [se*]."}
    Default{
            "No hay coincidencias con [$_]"
           } 
}

$email = 'antonio.yanez@edu.es'
$email2 = 'antonio.yanez@edu.gal'
$url = 'https://www.dc.fi.edc.es/~afyanez/Docencia/2023'
switch -Regex($url, $email, $email2)
{
    '^\w+\.\w+@(udc|usc|edu)\.es|gal$' {"[$_] es una direccion de correo electronico academica"}
    '^ftp\://.*$' { "[$_] es una direccion ftp" }
    '^(https[s]?)\://.*$'{ "[$_] es una direccion web, que utiliza [$($matches[1])]" } 
} 
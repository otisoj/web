<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Proceso</title>
    </head>
    <body>

        <%
            String GRANDE = "grande", MEDIANO = "mediano", CHICO = "chico";
            int valorHora = 0;
            int valorTotal = 0;
            int valorDescuento = 0;
            int sumaTotal =0 ;
            
            int numMascota = Integer.parseInt(request.getParameter("numMascota"));
            
            String[] tipoPerro;
            tipoPerro = new String[numMascota];
            
            int horasPaseo = Integer.parseInt(request.getParameter("horaPaseo"));

            for (int i = 0; i < numMascota; i++) {
                tipoPerro[i] = request.getParameter("tipoPerro"+i);

                if (tipoPerro[i].equals(GRANDE)) {
                    valorHora = 10000 * horasPaseo;

                } else if (tipoPerro[i].equals(MEDIANO)) {
                    valorHora = 5000 * horasPaseo;

                } else if (tipoPerro[i].equals(CHICO)) {
                    valorHora = 2500 * horasPaseo;

                }

                sumaTotal += valorHora;

                if (numMascota > 1) {
                    valorDescuento = (int) (sumaTotal * 0.10);
                    valorTotal = (int) (sumaTotal - valorDescuento);
                } else {
                    valorTotal = sumaTotal;
                }
            }

        %>

        <h2>Resultado del Paseo de Perros</h2>
        <p>Horas de Paseo: <%= horasPaseo%></p>
        <p>Número de Mascotas: <%= numMascota%></p>
        <p>Valor del Paseo: <%= sumaTotal%></p>
        <p>El valor de Descuento es: <%= valorDescuento%></p>
        <p>Valor total con Descuento: <%= valorTotal%></p>

    </body>
</html>

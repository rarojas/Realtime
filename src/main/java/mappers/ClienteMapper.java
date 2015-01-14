package mappers;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.energyview.realtime.model.Cliente;

public class ClienteMapper implements RowMapper<Cliente>{

	@Override
	public Cliente mapRow(ResultSet rs, int rowNo) throws SQLException {
		Cliente cliente = new Cliente();
		cliente.idcliente = rs.getString("idcliente");
		cliente.cliente = rs.getString("cliente");
		return cliente;
	}

	
}

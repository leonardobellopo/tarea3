#Solution File
class Node
	def initialize (datos,referencia=nil)
		@datos=datos
		@referencia=referencia
	end

	def get_referencia
		return @referencia
	end

	def set_referencia(nuevareferencia)
		@referencia=nuevareferencia
	end

	def get_datos
		return @datos
	end

	def set_datos(nuevos)
		@datos=nuevos
	end

	
end

class Linkedlist
	def initialize
		@tam=0
		@header=nil
	end

	def anadir (valor)
		@tam=@tam+1

		if @header==nil
			@header=Node.new(valor)
		else
		nodoactual=@header
		while nodoactual.get_referencia !=nil
			nodoactual=nodoactual.get_referencia
		end
		nodoactual.set_referencia( Node.new(valor) )
		end
	end

	def delete_element(datosaeliminar)
		nodoactual=@header
		if nodoactual.get_datos==datosaeliminar
			@header=@header.get_referencia
		else
			nodoactual=@header
			while(nodoactual.get_referencia !=nil) && ((nodoactual.get_referencia).get_datos !=datosaeliminar)
				nodoactual=nodoactual.get_referencia
			end
			if (nodoactual !=nil) && (nodoactual.get_referencia !=nil)
				nodoactual.set_referencia( (nodoactual.get_referencia).get_referencia )
			end
    		end
	end

	def print_list
		nodoactual=@header
		complete_list=[]
		while nodoactual.get_referencia !=nil
			complete_list+=[nodoactual.get_datos.to_s]
			nodoactual=nodoactual.get_referencia
		end
		complete_list+=[nodoactual.get_datos.to_s]
		printing = ""
		tamprinting=@tam-1
		for i in(0..tamprinting)
			printing=printing+complete_list[i].to_s
			if i <tamprinting
			printing+= ","
			end
		end
		puts printing
	end

	def get_tam
		return@tam
	end
end

list=Linkedlist.new
detention=nil
while detention !=-1
	z=gets.chomp
	if z.to_i==-1
		detention =-1
	else
	list.anadir(z)
	end
end

list.print_list


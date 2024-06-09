package main

/*
Name: Daniel Eccleston
ID: 1905285

*/

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"
import "core:unicode/utf8"

readString :: proc(buff: ^[255]u8) -> string{
    //buff : [255]u8
    len, err := os.read(os.stdin, buff[:])
    input := string(buff[:len])

    return input        
}

readInt :: proc() -> int{
	buff: [255]u8
	len, err := os.read(os.stdin, buff[:])
    input:= strconv.atoi(string(buff[:len]))

	return input
}

getValue:: proc(name:[]rune)-> [dynamic]int{
    value: [dynamic]int
    for char in name{
        count := 0
        for i := 0; i <= 25; i += 1{
           if char == rune('a'+ i){
            append(&value, i)
           }
        }

        count += 1

    }
    return value

}

getText :: proc(value:[dynamic]int) -> [dynamic]rune{
    text :[dynamic]rune
    for num,index in value{
        append(&text,rune('a'+ value[index]))
    }

    return text


}





main :: proc(){
    buff: [255]u8



    
    

    fmt.printf("Please enter the plain text ")
    name :=  utf8.string_to_runes(strings.trim_right_space(readString(&buff)))
    fmt.printf("Please enter the  keyword ")
    keyword:=  utf8.string_to_runes(strings.trim_right_space(readString(&buff)))
   
    
    if( len(name) != len(keyword)){
        
        fmt.printf("Error, plaintext and keyword must be the same length, length is %v\n", len(keyword))
    }

    
    


    name_value: [dynamic]int
    key_value: [dynamic]int
    cipher_value: [dynamic]int
    
    name_value = getValue(name)
    key_value = getValue(keyword)

    fmt.println("Name:",name)
    fmt.println("Name value:", name_value)
    fmt.println("keyword:", keyword)
    fmt.println("Keyword value:", key_value)

    
    
    
    cipher_text:=  keyword[:]

    

    for num,index in name_value{
        value := name_value[index] + key_value[index]
        if value > 25{
            value -= 26
            
        }
        append(&cipher_value, value)
        


    }
    fmt.println("CipherValue:", cipher_value)
       

    cipher_text = getText(cipher_value)[:]
   
    
    fmt.println("Ciphertext:", cipher_text)


    fmt.println(" Enter Key value ")

    keyword = utf8.string_to_runes(strings.trim_right_space(readString(&buff)))


    fmt.println(" Enter ccipher text (Must be the same length as key value)")

    cipher_text = utf8.string_to_runes(strings.trim_right_space(readString(&buff)))
    key_value = getValue(keyword)


    key_value = getValue(keyword)
    cipher_value = getValue(cipher_text)


    fmt.println("Keyword:", keyword)
    fmt.println("Keyword value:", key_value)
    fmt.println("Cipher:",cipher_text)
    fmt.println("Cipher value:",cipher_value)
    

    plain_text: [dynamic]rune
    plain_value: [dynamic]int

    for num,index in cipher_value{
        value := cipher_value[index] - key_value[index]
        if value < 0{
            value += 26
        }
        append(&plain_value, value)     
        


    }

    plain_text= getText(plain_value)

    

    fmt.println("Plain text value", plain_value)
    fmt.println("Plain text ", plain_text)



    


    









    



    

} 




#
# Global data (val1 and val2)
#
    .data
    .comm systolic,1
    .global systolic
    .comm diastolic,1
    .global diastolic

#
# Program code (compute function)
#
      .text
      .global setLEDs
      .global Green
      .global Red
      .global Yellow


               
                
setLEDs:
        #Naming and setting up the variables
        ldi r19, 140
        ldi r20, 120
        ldi r21, 80
        ldi r22, 90
        lds r23, systolic
        lds r24, diastolic
        
        #RED LIGHT 
        #If Systolic value is 140 or above jump to red
        cp r23, r19
        BRSH Red
        #If Diastolic is 90 or above jump to red
        cp r24, r22
        BRSH Red
   
        #GREEN LIGHT
        cp r23, r20
        cp r24, r21
        BRLO Green
        
        #YELLOW LIGHT
        rjmp Yellow
        
Green:
        #Turns on the green light
        ldi r18, 0x08
        out 0x04, r18  ; 0x04 is I/O address of DDRB
        out 0x05, r18  ; 0x05 is I/O address of PORTB
        ret
        
Yellow:
        #Turns on the yellow light
        ldi r18, 0x20
        out 0x04, r18  ; 0x04 is I/O address of DDRB
        out 0x05, r18  ; 0x05 is I/O address of PORTB
        ret
        
Red:
        #Turns on the red light
        ldi r18, 0x02
        out 0x04, r18  ; 0x04 is I/O address of DDRB
        out 0x05, r18  ; 0x05 is I/O address of PORTB
        ret
        


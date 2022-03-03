;//////////////  rule global   ///////////////
(defglobal

  ?*pneumonia* = 0
  ?*tuberkulosis* = 0
  ?*ppok* = 0

)
;//////////////      intro     ///////////////
(defrule Ask
	=>
	(printout t crlf  "apakah anda ingin mengecek penyakit anda (ya/tidak)" crlf)
	(bind ?answer (read))
		(if (eq ?answer ya)
			 then (printout t crlf "beri tahu gejala yang dirasakan" crlf)
             (assert (check_sesaknapas))
		)
		(if (eq ?answer tidak)
			then (printout t crlf "terima kasih, stay healthy ^^" crlf)
		)
)

;///////////////   tahap 1   ///////////////
(defrule sesaknapas
    (check_sesaknapas)
    =>
    (printout t crlf "Apakah anda merasa sesak napas? (y/t)" crlf)
    (bind ?answer (read))
        (if (eq ?answer y)
            then
                (bind ?*pneumonia* (+ ?*pneumonia* 1))
                (bind ?*tuberkulosis* (+ ?*tuberkulosis* 1))
                (bind ?*ppok* (+ ?*ppok* 1))
                (assert (sesaknapas))
                    (assert (check_demam))
            else
                (assert (tidak_sesaknapas))
                    (assert (check_demam))
        )
)
(defrule demam
    (check_demam)
    =>
    (printout t crlf "Apakah anda merasa demam? (y/t)" crlf)
    (bind ?answer (read))
        (if (eq ?answer y)
            then
                (bind ?*pneumonia* (+ ?*pneumonia* 1))
                (bind ?*tuberkulosis* (+ ?*tuberkulosis* 1))
                (bind ?*ppok* (+ ?*ppok* 1))
                (assert (demam))
                    (assert (check_lelah))
            else
                (assert (tidak_demam))
                    (assert (check_lelah))
        )
)

(defrule lelah
    (check_lelah)
    =>
    (printout t crlf "Apakah anda merasa lelah? (y/t)" crlf)
    (bind ?answer (read))
        (if (eq ?answer y)
            then
                (bind ?*pneumonia* (+ ?*pneumonia* 1))
                (bind ?*tuberkulosis* (+ ?*tuberkulosis* 1))
                (bind ?*ppok* (+ ?*ppok* 1))
                (assert (lelah))
                    (assert (check_batukberdahak))
            else
                (assert (tidak_lelah))
                    (assert (check_batukberdahak))
        )
)

(defrule batukberdahak
    (check_batukberdahak)
    =>
    (printout t crlf "Apakah anda merasa batuk berdahak? (y/t)" crlf)
    (bind ?answer (read))
        (if (eq ?answer y)
            then
                (bind ?*pneumonia* (+ ?*pneumonia* 1))
                (bind ?*tuberkulosis* (+ ?*tuberkulosis* 1))
                (bind ?*ppok* (+ ?*ppok* 1))
                (assert (batukberdahak))
                    (assert (check_nyeridada))
            else
                (assert (tidak_batukberdahak))
                    (assert (check_nyeridada))
        )
)

(defrule nyeridada
    (check_nyeridada)
    =>
    (printout t crlf "Apakah anda merasa nyeri di dada? (y/t)" crlf)
    (bind ?answer (read))
        (if (eq ?answer y)
            then
                (bind ?*pneumonia* (+ ?*pneumonia* 1))
                (bind ?*tuberkulosis* (+ ?*tuberkulosis* 1))
                (bind ?*ppok* (+ ?*ppok* 1))
                (assert (nyeridada))
                    (assert (check_keringatmalam))
            else
                (assert (tidak_nyeridada))
                    (assert (check_keringatmalam))
        )
)

(defrule keringatmalam
    (check_keringatmalam)
    =>
    (printout t crlf "Apakah anda merasa keringat di malam hari? (y/t)" crlf)
    (bind ?answer (read))
        (if (eq ?answer y)
            then
                (bind ?*pneumonia* (- ?*pneumonia* 1))
                (bind ?*tuberkulosis* (+ ?*tuberkulosis* 1))
                (bind ?*ppok* (+ ?*ppok* 1))
                (assert (keringatmalam))
                    (assert (check_nafsubb))
            else
                (assert (tidak_keringatmalam))
                    (assert (check_nafsubb))
        )
)

(defrule nafsubb
    (check_nafsubb)
    =>
    (printout t crlf "Apakah anda merasa tidak nafsu makan dan berat badan turun? (y/t)" crlf)
    (bind ?answer (read))
        (if (eq ?answer y)
            then
                (bind ?*pneumonia* (- ?*pneumonia* 1))
                (bind ?*tuberkulosis* (+ ?*tuberkulosis* 1))
                (bind ?*ppok* (+ ?*ppok* 1))
                (assert (nafsubb))
                    (assert (check_batukberdarah))
            else
                (assert (tidak_nafsubb))
                    (assert (check_batukberdarah))
        )
)

(defrule batukberdarah
    (check_batukberdarah)
    =>
    (printout t crlf "Apakah anda merasa batuk disertai darah? (y/t)" crlf)
    (bind ?answer (read))
        (if (eq ?answer y)
            then
                (bind ?*pneumonia* (- ?*pneumonia* 1))
                (bind ?*tuberkulosis* (+ ?*tuberkulosis* 1))
                (bind ?*ppok* (+ ?*ppok* 1))
                (assert (batukberdarah))
                    (assert (check_bibirjari))
            else
                (assert (tidak_batukberdarah))
                    (assert (check_bibirjari))
        )
)

(defrule bibirjari
    (check_bibirjari)
    =>
    (printout t crlf "Apakah anda merasa bibir dan jari berwarna kebiruan? (y/t)" crlf)
    (bind ?answer (read))
        (if (eq ?answer y)
            then
                (bind ?*pneumonia* (- ?*pneumonia* 1))
                (bind ?*tuberkulosis* (- ?*tuberkulosis* 1))
                (bind ?*ppok* (+ ?*ppok* 1))
                (assert (bibirjari))
                    (assert (check_kakibengkak))
            else
                (assert (tidak_bibirjari))
                    (assert (check_kakibengkak))
        )
)

(defrule kakibengkak
    (check_kakibengkak)
    =>
    (printout t crlf "Apakah anda merasa kaki dan tungkai membengkak? (y/t)" crlf)
    (bind ?answer (read))
        (if (eq ?answer y)
            then
                (bind ?*pneumonia* (- ?*pneumonia* 1))
                (bind ?*tuberkulosis* (- ?*tuberkulosis* 1))
                (bind ?*ppok* (+ ?*ppok* 1))
                (assert (kakibengkak))
                    (assert (check_diagnosa))
            else
                (assert (tidak_kakibengkak))
                    (assert (check_diagnosa))
        )
)

(defrule diagnosa
    (check_diagnosa)
    =>
        (if (eq ?*ppok* 10)
            then
            (printout t crlf "Anda mengalami gejala Penyakit Paru Obstruktif Kronis, silahkan melakukan pemeriksaan untuk tindakan lebih lanjut" crlf)
            (printout t crlf"terima kasih ^^" crlf)
        else
            (if (eq ?*tuberkulosis* 8)
                then
                (printout t crlf "Anda mengalami gejala Tuberkulosis, silahkan melakukan pemeriksaan untuk tindakan lebih lanjut" crlf)
                (printout t crlf"terima kasih ^^" crlf)
            else
                (if (eq ?*pneumonia* 5)
                    then
                    (printout t crlf "Anda mengalami gejala Pneumonia, silahkan melakukan pemeriksaan untuk tindakan lebih lanjut" crlf)
                    (printout t crlf"terima kasih ^^" crlf)
                else
                (printout t crlf "Penyakit dengan gejala yang dirasakan tidak dapat di diagnosa. Silahkan pergi kedokter atau rumah sakit untuk mengetahuinya" crlf)
                (printout t crlf"terima kasih ^^" crlf)
                )
            )
        )
)
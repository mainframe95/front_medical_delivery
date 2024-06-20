//Procedure Executer;
var
  vCursor : TdbCursor;
  vWhere : String;
  aFact : TPieceFacturation;
begin
  messageSchema := FALSE;

  vCursor := GetCursor(1);

  if dateInf <> 0 then
    vCursor.Where := '(datePiece >= %6) and (datePiece <= %1)'
  else
    vCursor.Where := '(datePiece <= %1)';
  vCursor.Where := vCursor.Where + 'and(comptabilise = %2)';
  vCursor.Where := vCursor.Where + 'and(supprimee = %3)';
  if attributFiltreESM <> '' then
    vCursor.Where := vCursor.Where + 'and('+ attributFiltreESM + '=%4)';
  vCursor.Where :=  GetWhere(vCursor);
  vWhere := _GetWhereObjectList('RoleTiersFacture.CategorieComptaTiers', CatComptaList);   // get object list
  if vWhere <> '' then
    vCursor.Where := vCursor.Where + 'and'+ vWhere;

  vCursor.OrderBy := 'noPiece';
  vCursor.ArgCount := 6;
  vCursor.Args[1]:= dateSup;
  vCursor.Args[2]:= FALSE;
  vCursor.Args[3]:= FALSE;
  if (attributFiltreESM <> '') and (valeurFiltreESM <> '') then
    vCursor.Args[4]:= valeurFiltreESM;
  vCursor.Args[5]:= dateEdite;
  vCursor.Args[6]:= dateInf;
  vCursor.NoLock := True;

  vCursor.Open;
  ProgressMessage(_TP('Vérification des schémas comptables.'));
  VerificationSchemaHT;
  VerificationSchemaTaxe;
  if messageSchema then
    ProgressMessage(_TP('Le traitement a été abandonné à la vérification des schémas comptables.'))
  else
  begin
    ProgressMessage(_TP('Vérification des schémas comptables réalisée.'));
    if vCursor.eoi then
      ProgressMessage(_TP('Aucune facture à comptabiliser pour la sélection.'));
    TraiterCursor(vCursor);
  end;
  _JournaliserEvenement;
end;


assujettissementForce	baseHTCredit	baseHTCredit_CodeDevise	baseHTCredit_Date	baseHTCredit_TCConv	baseHTCredit_TCValue	baseHTCredit_RPConv	baseHTCredit_RPValue	baseHTDebit	baseHTDebit_CodeDevise	baseHTDebit_Date	baseHTDebit_TCConv	baseHTDebit_TCValue	baseHTDebit_RPConv	baseHTDebit_RPValue	BaseHTProrata	BaseHTProrata_CodeDevise	BaseHTProrata_Date	BaseHTProrata_TCConv	BaseHTProrata_TCValue	BaseHTProrata_RPConv	BaseHTProrata_RPValue	Caption	CodeLettrageExterne	codePointageExterne	coefAssujettissement	coefAssujettissement_Decimales	coefTaxation	coefTaxation_Decimales	commentaire	credit	credit_CodeDevise	credit_Date	credit_TCConv	credit_TCValue	credit_RPConv	credit_RPValue	creditDeviseCompte	creditDeviseCompte_CodeDevise	dateDeclarationTVA	dateLettrage	debit	debit_CodeDevise	debit_Date	debit_TCConv	debit_TCValue	debit_RPConv	debit_RPValue	debitDeviseCompte	debitDeviseCompte_CodeDevise	echeancementEcriture	eDate	estBienImmo	estDetaillee	estHistoriseeTVA	excluImmo	exporte	idBienComptable	idOTP	ModeRempComposant	montant	montant_CodeDevise	montant_Date	montant_TCConv	montant_TCValue	montant_RPConv	montant_RPValue	montantTVAReel	montantTVAReel_CodeDevise	natureReglement	numEcritureBancaire	numero	numeroDefinitif	NumeroDest_Extourne	NumeroOri_Extourne	oid	oidAffaire	oidbaseTVA	oidCoefficientAdmission	oidcompteGeneral	oidDeclarationTVALigne	oidEcheance	oidGroupePointage	oidlettrageEcriture	oidMarquageEcriture	oidOriginePieceImmo	oidpiece	oidProfilTVA	oidregularisationTVA	oidrModeReglement	oidroleTiers	oidSecteurActivite	oidunite	ProrataTVA	ProrataTVA_Decimales	quantite	quantite_Decimales	quantite_CodeUnit	refacture	reference	referenceBien	regroupement	reserveGP	sens	SensProrata	traitementEcriture	typeEcriture	TypeMarquageExterne	UpdDate	UpdHistory	UpdStamp	UpdUser	oidMandatSEPA	dateValeur	oidEcritureRappro	oidSousGroupePointage	DeverseAssurance	oidClefDeversementAssurance	oidCptDeversementAssurance	engagement	oidBudget	oidPeriodeBudgetaire	oidPosteBudgetaire	numeroDefinitifNODUP	Infolibre1	Infolibre2
0	0,00	XOF	2024-06-17 00:00:00.000	NULL	0,00	XOF:XOF:M:C:00000000:1;EUR:XOF:D:I:00000000:1;EUR:EUR:D:C:00000000:1	0,00	0,00	XOF	2024-06-17 00:00:00.000	NULL	0,00	XOF:XOF:M:C:00000000:1;EUR:XOF:D:I:00000000:1;EUR:EUR:D:C:00000000:1	0,00	0,00	XOF	2024-06-17 00:00:00.000	NULL	0,00	XOF:XOF:M:C:00000000:1;EUR:XOF:D:I:00000000:1;EUR:EUR:D:C:00000000:1	0,00	TES	NULL	NULL	0	2	0	2	NULL	2000,00	XOF	2024-06-17 00:00:00.000	NULL	2000,00	XOF:XOF:M:C:00000000:1;EUR:XOF:D:I:00000000:1;EUR:EUR:D:C:00000000:1	2000,00	0,00	XOF	1899-12-30 00:00:00.000	1899-12-30 00:00:00.000	0,00	XOF	2024-06-17 00:00:00.000	NULL	0,00	XOF:XOF:M:C:00000000:1;EUR:XOF:D:I:00000000:1;EUR:EUR:D:C:00000000:1	0,00	0,00	XOF	obj://TEcheancement/	2024-06-17 00:00:00.000	0	0	0	0	0	NULL	159	0	2000,00	XOF	2024-06-17 00:00:00.000	NULL	2000,00	XOF:XOF:M:C:00000000:1;EUR:XOF:D:I:00000000:1;EUR:EUR:D:C:00000000:1	2000,00	0,00	XOF	0	NULL	288235	0	0	0	42251B2FA2610008009F000004460005	NULL	NULL	NULL	42251B2FA261000800C2000000220055	NULL	NULL	NULL	NULL	NULL	NULL	42251B2FA26100080116000004460003	NULL	NULL	NULL	NULL	NULL	NULL	0	2	0	0	NULL	0	444	NULL	NULL	NULL	1	0	0	1	NULL	2024-06-17 09:44:16.500	4O/uCp8CAAD/////UuBVixeAdM6u2tOWD3+UUivzdsOoxYFwXJg6gwchEo1lUpRCzpnnD0/lWU5zshxecKytsna2XhAHNG0+Kvtqvbhx+ZbOKXCbNFnfsBwscsr19BEDqrFDspXHbOV0AHRXcl6c/OrqOP6uq4WRlHjShNxJJHvUKEA3lujE3UIQHwfIe2CPL1kKusms2YSBvZaubQu7CaUYmIPeOdCmWBtCYQgqE1l2m/u96m6zcxKKdOzqGAMTt8uBOtMj1MW3aint7Yzl5QA4q+1/2+ZUnyEEtz2NRjnco67YSXNSmd4gqvAfNHTNFcO7a0X090GZnkm2bZ3zayhND+bVbOY7X1t/m2r46RNLTWD8WfiW9vISBH3XplzC6wRqfPwzN4MIAAQA7nqLE4mhY2tthANQaO3ULt/pIykQW3Gijgip+i9KHv4gg/42v7dodvrMbkoziOlpVYMTkijI1WTv0aTGutXrKaeEzui+o1/nrWZpnhzq1csgXpAB23/EPy1q/3bpJ0SeFLN6y/DSrHwbU7vKmqpfpyHbp3RKOp/4iXAZ8wfNx+RCDRIuyfWr3sVTKgEkYVylXXyZ+D3yUUDa9oQjRVyWmUdl9I0ZiCTDU50OKj6n1zyn+t1zRBNrBbEd2ghTdv5ROpW9CjKVxpHFvxLYDsqCcH6LsgBjtm0//SAT9dNq3B3A+i8lyqpqwJVmjvwWUom/LVSpQ36hfjvKtqejtg1X3pdSaWljU9551KT5OtMJsLj/Tdl01So4L4W8FzPyHOugfTTAvPTCi0jJmWNHxEyV3QAOhJ/h6A4+6IPqu38m1qO81mA4Rw0L4TfFNK4yUtth7eL0gPFoKe6CTUFMSK9bfttekCwKigga32kOS2j+HmAFhXGpQmM3ZKXiyWChl0jw	0000048400000006	sage	NULL	1899-12-30 00:00:00.000	NULL	NULL	0	NULL	NULL	0	NULL	NULL	NULL	1	NULL	NULL
0	0,00	XOF	2024-06-17 00:00:00.000	NULL	0,00	XOF:XOF:M:C:00000000:1;EUR:XOF:D:I:00000000:1;EUR:EUR:D:C:00000000:1	0,00	0,00	XOF	2024-06-17 00:00:00.000	NULL	0,00	XOF:XOF:M:C:00000000:1;EUR:XOF:D:I:00000000:1;EUR:EUR:D:C:00000000:1	0,00	0,00	XOF	2024-06-17 00:00:00.000	NULL	0,00	XOF:XOF:M:C:00000000:1;EUR:XOF:D:I:00000000:1;EUR:EUR:D:C:00000000:1	0,00	TES	NULL	NULL	0	2	0	2	NULL	0,00	XOF	2024-06-17 00:00:00.000	NULL	0,00	XOF:XOF:M:C:00000000:1;EUR:XOF:D:I:00000000:1;EUR:EUR:D:C:00000000:1	0,00	0,00	XOF	1899-12-30 00:00:00.000	1899-12-30 00:00:00.000	2000,00	XOF	2024-06-17 00:00:00.000	NULL	2000,00	XOF:XOF:M:C:00000000:1;EUR:XOF:D:I:00000000:1;EUR:EUR:D:C:00000000:1	2000,00	0,00	XOF	obj://TEcheancement/	2024-06-17 00:00:00.000	0	0	0	0	0	NULL	159	0	2000,00	XOF	2024-06-17 00:00:00.000	NULL	2000,00	XOF:XOF:M:C:00000000:1;EUR:XOF:D:I:00000000:1;EUR:EUR:D:C:00000000:1	2000,00	0,00	XOF	0	NULL	288236	0	0	0	42251B2FA2610008009F000004460008	NULL	NULL	NULL	42251B2FA261000800C20000001E0903	NULL	NULL	NULL	NULL	NULL	NULL	42251B2FA26100080116000004460003	NULL	NULL	NULL	NULL	NULL	NULL	0	2	0	0	NULL	0	444	NULL	NULL	NULL	0	0	0	1	NULL	2024-06-17 09:44:16.547	4O/uCq8CAAD/////VLgnVptQngfPivrCjnzEeNhNSBb0HecqpxVUOZVRwvqziy8CH9TMf0NwJIjM372olhDZpcND4BPf+Mc2/Z9RH+zI0lRbfJ8kq1rpEW0V9yZ5058rIdBorXTsEg7RA33x8ERnK7aCMSXcwSTxKR9P7zm3ZTPni4XbezqwAmrQkNwxTYs50yRLaSAC3nqVnqtLrPacHVdWufiiPPi8NRMjEOLl32sJ+gwTdgNAMRpP0N89nEOrSA0LFFap6xZjY0Vg5e9BhEs/jKncbmbSTzmhv6qKv8Pn+y3i4mIX3rTYUPeP+/miDkR01AjTD6eLGHmWqNecQIxARI7yIq8z1Q9YW5WX7S9+54ZC0vkUgAJwLp1geO1m3fxpAWOqNq6um+sSE9TUnEo8uio4tdV21O8UnCR1mY1GpTWtANYUwbnjA+POArwTpJYxrRnzmcknDPMDGy+/gCunv0IBzxqIITPbVLkspY5hof63Szed+7iZVwj8qb69vbIPE+neo+6BAh7YZsedKiBRedYA2P0+CB+Kbv/VRnPx9Qc4FrWxW0z/aQpRT3jfgjLdfLpjKqcKgMGoKQgXm5rrHnO1IeT/gH+pQBfGiN1uANmkTsPrc8BjIjAz63b4JcOCmv/KxqERCwlrDI6WpuW+5iOIzx0N4/SwtkbPuc7D/FrQ4YwEhjlx8OzK8cAWNpKH20hvhcWJvPwcfQS8hBmEXbbdIjmWMMK/rUI4l7QpV4bLby9+tiKQ+M9R/fATU1cbQ8L5jedqcZFpMmgVB++N7UnA68tlUv1WbNONnOn3wde0eAxFhuDtLY4uNb3O2dmugaGYUUZcUnczlU+8P/+fmmojVGsQhwV1pZnrOkLFZuiaj5oaBnmZJZE7RtGDbnRSFOXA8xBHI5QHaQWAH32QIPG1QnHk8s0PdA==	000004840000000A	sage	NULL	1899-12-30 00:00:00.000	NULL	NULL	0	NULL	NULL	0	NULL	NULL	NULL	1	NULL	NULL
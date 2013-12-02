// -------------------------------------------------------------------------- //
//                  Subtitle Workshop - Pascal scripts sample                 //
//                        Copyright � 2001-2003 URUSoft                       //
//                            http://urusoft.co.nr                            //
//                                                                            //
// -------------------------------------------------------------------------- //

program InsertCopyright;

// -----------------------------------------------------------------------------

uses sysutils;

var
  n: Integer;
  YY, MM, DD: Word;

begin
  n := GetSubtitleCount;
  InsertSubtitle(n, GetSubtitleFinalTime(n-1)+5000, GetSubtitleFinalTime(n-1)+10000,
                 'Checked with Subtitle Workshop', '�஢�७� �ணࠬ��� Subtitle Workshop');

  InsertSubtitle(n, GetSubtitleFinalTime(n-1)+5000, GetSubtitleFinalTime(n-1)+10000,
                 Date , '�஢�७� �ணࠬ��� Subtitle Workshop');
end.

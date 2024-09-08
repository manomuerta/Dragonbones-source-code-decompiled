package _609
{
   import _11111._11110;
   import _477.ExportController;
   import flash.display.BitmapData;
   
   public class HandleBackgroundColorTask extends _620
   {
      public function HandleBackgroundColorTask()
      {
         super();
      }
      
      override public function run() : void
      {
         var newResultBmpDs:Vector.<BitmapData>;
         var textureBmpDs:Vector.<BitmapData> = null;
         var i:int = 0;
         var len:int = 0;
         var _3692:BitmapData = null;
         var bgTextureBmpD:BitmapData = null;
         if(!_3613._3608.hasBackground)
         {
            complete();
            return;
         }
         if(Boolean(_3613._3690) && _3613._3690.length > 0)
         {
            textureBmpDs = _3613._3690;
         }
         else
         {
            textureBmpDs = _3613._3691;
         }
         newResultBmpDs = new Vector.<BitmapData>();
         try
         {
            if(textureBmpDs)
            {
               i = 0;
               len = int(textureBmpDs.length);
               while(i < len)
               {
                  _3692 = textureBmpDs[i];
                  if(_3692)
                  {
                     bgTextureBmpD = new BitmapData(_3692.width,_3692.height,false,_3608.backgroundColor);
                     if(bgTextureBmpD)
                     {
                        bgTextureBmpD.draw(_3692);
                        newResultBmpDs.push(bgTextureBmpD);
                     }
                  }
                  i++;
               }
               _3613._5409();
               _3613._3690 = newResultBmpDs;
            }
            complete();
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("HandleBackgroundColorTask::run",e);
            switch(e.errorID)
            {
               case 2015:
                  fail(ExportController.EXPORT_ERROR_PACK,null);
                  break;
               default:
                  fail(ExportController.EXPORT_ERROR_UNKNOW,null);
            }
         }
      }
   }
}


package _609
{
   import _11111._11110;
   import _477.ExportController;
   import flash.display.BitmapData;
   import flash.display.Shape;
   
   public class HandleTransparentBgTask extends _620
   {
      private static var _5419:BitmapData;
      
      public function HandleTransparentBgTask()
      {
         super();
      }
      
      override public function run() : void
      {
         var textureBmpDs:Vector.<BitmapData> = null;
         var newResultBmpDs:Vector.<BitmapData> = null;
         var i:int = 0;
         var len:int = 0;
         var _3692:BitmapData = null;
         var bgTextureBmpD:BitmapData = null;
         try
         {
            if(Boolean(_3613._3690) && _3613._3690.length > 0)
            {
               textureBmpDs = _3613._3690;
            }
            else
            {
               textureBmpDs = _3613._3691;
            }
            newResultBmpDs = new Vector.<BitmapData>();
            if(textureBmpDs == null || textureBmpDs.length == 0)
            {
               complete();
               return;
            }
            i = 0;
            len = int(textureBmpDs.length);
            while(i < len)
            {
               _3692 = textureBmpDs[i];
               if(_3692)
               {
                  bgTextureBmpD = this._5418(_3692.width,_3692.height);
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
            complete();
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("HandleTransparentBgTask::run",e);
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
      
      private function _5417() : void
      {
         var _loc1_:int = 20;
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.beginFill(5855326);
         _loc2_.graphics.drawRect(0,0,_loc1_ * 2,_loc1_ * 2);
         _loc2_.graphics.beginFill(6513256);
         _loc2_.graphics.drawRect(0,0,_loc1_,_loc1_);
         _loc2_.graphics.drawRect(_loc1_,_loc1_,_loc1_,_loc1_);
         _loc2_.graphics.endFill();
         _5419 = new BitmapData(_loc1_ * 2,_loc1_ * 2);
         _5419.draw(_loc2_);
      }
      
      private function _5418(param1:int, param2:int) : BitmapData
      {
         if(_5419 == null)
         {
            this._5417();
         }
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.beginBitmapFill(_5419,null);
         _loc3_.graphics.drawRect(0,0,param1,param2);
         _loc3_.graphics.endFill();
         var _loc4_:BitmapData = new BitmapData(param1,param2,false);
         _loc4_.draw(_loc3_);
         return _loc4_;
      }
   }
}


package _609
{
   import _11111._11110;
   import _477.ExportController;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class HandleSquareTask extends _620
   {
      public function HandleSquareTask()
      {
         super();
      }
      
      override public function run() : void
      {
         var i:int = 0;
         var len:int = 0;
         var _3692:BitmapData = null;
         var squareSize:int = 0;
         var squareBmpD:BitmapData = null;
         if(!_3613._3608._5416)
         {
            complete();
            return;
         }
         if(_3613._3690 == null)
         {
            _3613._3690 = new Vector.<BitmapData>();
         }
         else
         {
            _3613._5409();
         }
         try
         {
            i = 0;
            len = int(_3613._3691.length);
            while(i < len)
            {
               _3692 = _3613._3691[i];
               if(_3692 && _3608._5416 && _3692.width != _3692.height)
               {
                  squareSize = _3692.width > _3692.height ? _3692.width : _3692.height;
                  squareBmpD = new BitmapData(squareSize,squareSize,true,0);
                  squareBmpD.copyPixels(_3692,new Rectangle(0,0,_3692.width,_3692.height),new Point());
                  _3613._3690.push(squareBmpD);
               }
               i++;
            }
            complete();
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("HandleSquareTask::run",e);
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


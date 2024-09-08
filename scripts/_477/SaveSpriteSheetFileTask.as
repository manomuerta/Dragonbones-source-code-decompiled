package _477
{
   import _11111._11110;
   import _1315._1319;
   import _97._118;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.utils.ByteArray;
   
   public class SaveSpriteSheetFileTask extends _494
   {
      private var _3711:Object;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _3688:Number;
      
      private var _3687:Number;
      
      public function SaveSpriteSheetFileTask(param1:Object, param2:Number, param3:Number, param4:Number, param5:Number)
      {
         super();
         this._3711 = param1;
         this._width = param2;
         this._height = param3;
         this._3688 = param4;
         this._3687 = param5;
      }
      
      override public function run() : void
      {
         var smoothing:Boolean;
         var bmpD:BitmapData = null;
         var path:String = null;
         var pngData:ByteArray = null;
         var pngEncoder:_1319 = new _1319();
         var m:Matrix = new Matrix();
         m.tx = this._3688 + this._3711.povitX;
         m.ty = this._3687 + this._3711.povitY;
         smoothing = _3238.scale != 1;
         try
         {
            if(smoothing)
            {
               this._width *= _3238.scale;
               this._height *= _3238.scale;
               m.scale(_3238.scale,_3238.scale);
            }
            if(this._width < 1)
            {
               this._width = 1;
            }
            if(this._height < 1)
            {
               this._height = 1;
            }
            bmpD = new BitmapData(this._width,this._height,true,0);
            if(this._3711.assetData)
            {
               bmpD.draw(this._3711.assetData,m,null,null,null,smoothing);
            }
            path = _3613.ouputPath + this._3711.name + ".png";
            pngData = pngEncoder.encode(bmpD);
            bmpD.dispose();
            bmpD = null;
            _118.save(path,pngData,true,"",false,this._3682,this._3683);
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("SaveSpriteSheetFileTask::run",e);
            _3683();
         }
      }
      
      private function _3683() : void
      {
         fail(ExportController.EXPORT_ERROR_SAVE_FILE,null);
      }
      
      private function _3682() : void
      {
         complete();
      }
   }
}


package _477
{
   import _11111._11110;
   import _13503._13502;
   import _1404._1407;
   import _51._50;
   import _586._596;
   import _73.SymbolType;
   
   public class RenderAnimationFramesTask extends _494
   {
      private var _3605:String;
      
      private var _3607:String;
      
      public function RenderAnimationFramesTask(param1:String, param2:String)
      {
         super();
         this._3605 = param2;
         this._3607 = param1;
      }
      
      override public function run() : void
      {
         var _1886:_50;
         var _1992:_13502 = null;
         var rateScale:Number = NaN;
         var totalFrame:int = 0;
         var animationName:String = null;
         var i:int = 0;
         var len:int = 0;
         var pos:Number = NaN;
         var o:Object = null;
         var framesData:Array = [];
         if(Boolean(_3613._3614[this._3607]) && Boolean(_3613._3614[this._3607][this._3605]))
         {
            framesData = _3613._3614[this._3607][this._3605];
            complete();
            return;
         }
         _1886 = _3238.dragonBonesVO._2107(this._3607);
         if(_1886)
         {
            _1992 = _1886._13656(this._3605);
            if(_1992)
            {
               this._3443._3606(_1886);
               this._3443._3604(_1992);
               _1992._1874();
               if(_3238.exportFrameRate <= 0)
               {
                  rateScale = 1;
               }
               else
               {
                  rateScale = _3238.exportFrameRate / _1992.frameRate;
               }
               totalFrame = _1992.duration;
               totalFrame = Math.ceil(totalFrame * rateScale);
               if(totalFrame == 0)
               {
                  totalFrame = 1;
               }
               animationName = _1992.name;
               i = 0;
               len = totalFrame;
               while(i < len)
               {
                  pos = i / rateScale;
                  try
                  {
                     o = this._3443._3681(pos,true,_3238._13268);
                  }
                  catch(e:Error)
                  {
                     _11110.instance._11204._11132("RenderAnimationFramesTask::run",e);
                     fail(ExportController.EXPORT_OUT_MEMORY);
                     return;
                  }
                  o.name = animationName + "_" + i;
                  o.frame = i;
                  framesData.push(o);
                  i++;
               }
               if(pos < totalFrame && _1886._1811 != SymbolType.SHEET)
               {
                  pos = totalFrame;
                  try
                  {
                     o = this._3443._3681(pos,true,_3238._13268);
                  }
                  catch(e:Error)
                  {
                     _11110.instance._11204._11132("RenderAnimationFramesTask::run",e);
                     fail(ExportController.EXPORT_OUT_MEMORY);
                     return;
                  }
                  o.name = animationName + "_" + i;
                  o.frame = i;
                  framesData.push(o);
               }
               if(_3613._3614[this._3607] == null)
               {
                  _3613._3614[this._3607] = {};
               }
               _3613._3614[this._3607][this._3605] = framesData;
               _1992._1868();
               complete();
            }
            else
            {
               fail(ExportController.EXPORT_ERROR_UNKNOW,null);
            }
         }
         else
         {
            fail(ExportController.EXPORT_ERROR_UNKNOW,null);
         }
      }
      
      private function get _3443() : _596
      {
         return _1407.getInstance(_596) as _596;
      }
   }
}


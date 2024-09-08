package _477
{
   import _11111._11110;
   import _1404._1407;
   import _51._50;
   import _586._596;
   
   public class RenderCurrentFramesTask extends _494
   {
      private var _3605:String;
      
      private var _3607:String;
      
      private var _3684:int;
      
      public function RenderCurrentFramesTask(param1:String, param2:String = null, param3:int = -1)
      {
         super();
         this._3607 = param1;
         this._3605 = param2;
         this._3684 = param3;
      }
      
      override public function run() : void
      {
         var _1886:_50;
         var o:Object = null;
         var framesData:Array = [];
         _3613._3614[this._3607] = null;
         _1886 = _3238.dragonBonesVO._2107(this._3607);
         if(_1886)
         {
            this._3443._3606(_1886);
            this._3443._3604(null);
            try
            {
               o = this._3443._3681(this._3684,true);
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("RenderCurrentFramesTask::run",e);
               fail(ExportController.EXPORT_OUT_MEMORY);
               return;
            }
            o.name = this._3607 + this._3605 != null ? "_" + this._3605 + "_" + this._3684 : "";
            o.frame = this._3684;
            framesData.push(o);
            if(_3613._3614[this._3607] == null)
            {
               _3613._3614[this._3607] = {};
            }
            _3613._3614[this._3607][_495.SINGLE_FLAG] = framesData;
            complete();
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


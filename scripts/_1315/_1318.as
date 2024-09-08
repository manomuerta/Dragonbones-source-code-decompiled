package _1315
{
   import _1302._1305;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class _1318 implements _1305
   {
      private var _9173:Dictionary;
      
      public function _1318()
      {
         super();
      }
      
      public function get _9108() : String
      {
         return "png";
      }
      
      public function decode(param1:ByteArray, param2:Function) : void
      {
         var _loc3_:Loader = new Loader();
         var _loc4_:LoaderContext = new LoaderContext();
         if(_loc4_.hasOwnProperty("imageDecodingPolicy"))
         {
            _loc4_["imageDecodingPolicy"] = "onLoad";
         }
         _loc3_.contentLoaderInfo.addEventListener(Event.COMPLETE,this._8652);
         if(this._9173 == null)
         {
            this._9173 = new Dictionary();
         }
         this._9173[_loc3_] = param2;
         _loc3_.loadBytes(param1,_loc4_);
      }
      
      private function _8652(param1:Event) : void
      {
         var _loc2_:Loader = (param1.target as LoaderInfo).loader;
         _loc2_.contentLoaderInfo.removeEventListener(Event.COMPLETE,this._8652);
         var _loc3_:BitmapData = (_loc2_.content as Bitmap).bitmapData;
         if(this._9173[_loc2_] != null)
         {
            this._9173[_loc2_](_loc3_);
         }
         delete this._9173[_loc2_];
      }
   }
}


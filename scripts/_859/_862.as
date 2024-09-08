package _859
{
   import _1404._1407;
   import _521._528;
   import _724._725;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public class _862 extends Bitmap implements _860
   {
      private var _5741:Boolean;
      
      private var _5740:Boolean;
      
      private var _2101:_725;
      
      public function _862()
      {
         super();
      }
      
      public function set _5724(param1:Object) : void
      {
         if(param1 is BitmapData)
         {
            this.bitmapData = param1 as BitmapData;
         }
      }
      
      public function get _5747() : Boolean
      {
         return this._5741;
      }
      
      public function get _5744() : Boolean
      {
         return this._5740;
      }
      
      public function set _5747(param1:Boolean) : void
      {
         this._5741 = param1;
      }
      
      public function set _5744(param1:Boolean) : void
      {
         this._5740 = param1;
      }
      
      public function set _2104(param1:_725) : void
      {
         if(this._2101 != param1)
         {
            if(this._2101 != null)
            {
               this._2101._5725(this);
            }
            this._2101 = param1;
            if(this._2101 != null)
            {
               if(this._2101)
               {
                  this._2101._5735(this);
               }
            }
         }
      }
      
      private function get _6211() : _528
      {
         return _1407.getInstance(_528) as _528;
      }
      
      public function get _2104() : _725
      {
         return this._2101;
      }
      
      public function dispose() : void
      {
      }
   }
}


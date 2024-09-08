package _226
{
   import _1374.ColorPicker;
   import _1404._1407;
   import _51._52;
   import _586._588;
   import _93._92;
   
   public class _14061 extends _92
   {
      public function _14061()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2877._3198._14416(this._4445,this.newColor);
         this._14418._4061 = this.newColor;
      }
      
      override public function revert() : void
      {
         var _loc1_:_52 = null;
         super.revert();
         var _loc2_:int = 0;
         while(_loc2_ < this._4445.length)
         {
            _loc1_ = this._4445[_loc2_];
            if(this._2956[_loc1_.name])
            {
               this._2877._3198._14416([this._4445[_loc2_]],this._2956[_loc1_.name]);
            }
            _loc2_++;
         }
         this._14418._4061 = this._14417;
      }
      
      protected function get _4445() : Array
      {
         return _2223._4445;
      }
      
      protected function get newColor() : uint
      {
         return _2223.newColor;
      }
      
      protected function get _2956() : Object
      {
         return _2223._2956;
      }
      
      protected function get _14418() : ColorPicker
      {
         return _2223._14418;
      }
      
      protected function get _14417() : uint
      {
         return _2223._14417;
      }
      
      protected function get _2877() : _588
      {
         return _1407.getInstance(_588) as _588;
      }
   }
}


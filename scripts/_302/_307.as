package _302
{
   import _319._328;
   import _51._70;
   import _658.Mesh;
   import _658._661;
   
   public class _307 extends _328
   {
      public function _307()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override protected function _2211() : *
      {
         var _loc1_:Mesh = this._1838.mesh;
         var _loc2_:Vector.<_661> = new Vector.<_661>();
         var _loc3_:int = 0;
         var _loc4_:int = int(_loc1_._1812.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_.push(_loc1_._1812[_loc3_].clone() as _661);
            _loc3_++;
         }
         return {"_1812":_loc2_};
      }
      
      override public function execute() : void
      {
         var _loc1_:Mesh = this._1838.mesh;
         var _loc2_:int = 0;
         var _loc3_:int = int(_loc1_._1812.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_._1812[_loc2_].x = _loc1_.vertices[_loc2_].x;
            _loc1_._1812[_loc2_].y = _loc1_.vertices[_loc2_].y;
            _loc2_++;
         }
         _loc1_.invalid = true;
         _loc1_.update();
         _2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:Vector.<_661> = _2208._1812;
         var _loc2_:Mesh = this._1838.mesh;
         var _loc3_:int = 0;
         var _loc4_:int = int(_loc2_._1812.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_._1812[_loc3_].x = _loc1_[_loc3_].x;
            _loc2_._1812[_loc3_].y = _loc1_[_loc3_].y;
            _loc3_++;
         }
         _loc2_.invalid = true;
         _loc2_.update();
         _2894();
      }
      
      private function get _1838() : _70
      {
         return _2223._1838 as _70;
      }
   }
}


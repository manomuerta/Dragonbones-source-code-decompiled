package _226
{
   import _1404._1407;
   import _470._469;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._532;
   import _81._85;
   import _81._86;
   import _93._92;
   import flash.geom.Point;
   
   public class _231 extends _92
   {
      public function _231()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         var _loc4_:_86 = null;
         super.execute();
         var _loc1_:_233 = new _233();
         _loc1_._1572(_469._2897(this._2899,this._2890));
         _loc1_._2893();
         var _loc2_:_232 = new _232();
         _loc2_._1572(_469._2895(this.displayVO,this._2898,this._2899));
         var _loc3_:_86 = this._2890.globalTransform;
         if(!this._14391)
         {
            this.displayVO.localTransform.rotation = _85._1738(-_loc3_.rotation);
         }
         if(this._2549)
         {
            _loc4_ = new _86(this._2549.x,this._2549.y);
            _loc4_._2195(this._2890._2009,_loc3_);
            this.displayVO.localTransform.x = _loc4_.x;
            this.displayVO.localTransform.y = _loc4_.y;
         }
         _loc2_._2893();
         _loc1_._2894();
         this._2226._2484 = this._2899;
      }
      
      override public function revert() : void
      {
         super.revert();
         var _loc1_:_238 = new _238();
         _loc1_._1572(_469._2896(this._2899));
         _loc1_._2893();
         this._2226._2484 = this._2884;
         _loc1_._2894();
      }
      
      override protected function _2211() : *
      {
         return this._2226._2484;
      }
      
      protected function get displayVO() : _70
      {
         return _2223.displayVO;
      }
      
      protected function get _2898() : String
      {
         return _2223._2898;
      }
      
      protected function get _2899() : _79
      {
         return _2223._2899;
      }
      
      protected function get _2890() : _52
      {
         return _2223._2890;
      }
      
      protected function get _2549() : Point
      {
         return _2223._2549;
      }
      
      protected function get _2884() : Object
      {
         return _2208;
      }
      
      protected function get _14391() : Boolean
      {
         return _2223._14391;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}


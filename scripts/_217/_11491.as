package _217
{
   import _13503._13502;
   import _1404._1407;
   import _51._50;
   import _555.AnimationPanelController;
   import _555._570;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _11491 extends _92
   {
      public function _11491()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_13502 = null;
         var _loc4_:* = false;
         if(this._11959)
         {
            _loc1_ = 0;
            _loc2_ = int(this._11959.length);
            while(_loc1_ < _loc2_)
            {
               this._1886._13651(this._11959[_loc1_]);
               this._2858.delAnimation(this._11959[_loc1_]);
               _loc1_++;
            }
         }
         _loc1_ = 0;
         _loc2_ = int(this.animations.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this.animations[_loc1_];
            _loc4_ = _loc3_ == this._11958;
            this._1886._13580(this.animations[_loc1_]);
            this._2858.addAnimation(this.animations[_loc1_],_loc4_);
            _loc1_++;
         }
         this._2852._2855();
         this._2853.refresh();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_13502 = null;
         var _loc4_:* = false;
         _loc1_ = 0;
         _loc2_ = int(this.animations.length);
         while(_loc1_ < _loc2_)
         {
            this._1886._13651(this.animations[_loc1_]);
            this._2858.delAnimation(this.animations[_loc1_]);
            _loc1_++;
         }
         if(this._11959)
         {
            _loc1_ = 0;
            _loc2_ = int(this._11959.length);
            while(_loc1_ < _loc2_)
            {
               _loc3_ = this._11959[_loc1_];
               _loc4_ = _loc3_ == this._3648;
               this._1886._13580(this._11959[_loc1_]);
               this._2858.addAnimation(this._11959[_loc1_],_loc4_);
               _loc1_++;
            }
         }
         this._2853.refresh();
      }
      
      private function get _1886() : _50
      {
         return this.data.armature as _50;
      }
      
      private function get animations() : Vector.<_13502>
      {
         return this.data.animations as Vector.<_13502>;
      }
      
      private function get _11959() : Vector.<_13502>
      {
         return this.data._11959 as Vector.<_13502>;
      }
      
      private function get _3648() : _13502
      {
         return this.data.curAnimation as _13502;
      }
      
      private function get _11958() : _13502
      {
         return this.data._2854 as _13502;
      }
      
      private function get data() : Object
      {
         return _2223 as Object;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      private function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      private function get _2858() : AnimationPanelController
      {
         return _1407.getInstance(AnimationPanelController) as AnimationPanelController;
      }
   }
}


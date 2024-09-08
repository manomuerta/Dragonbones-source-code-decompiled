package _226
{
   import _1404._1407;
   import _555._571;
   import _676._684;
   import _703._702;
   import _93._92;
   
   public class _13513 extends _92
   {
      public function _13513()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._13716(this._13701,this._13718);
      }
      
      override public function revert() : void
      {
         super.revert();
         this._13721.reverse();
         this._13716(this._13720,this._13717);
         this._13721.reverse();
      }
      
      protected function _13716(param1:Array, param2:Array) : void
      {
         var _loc4_:_702 = null;
         var _loc5_:int = 0;
         var _loc6_:_684 = null;
         var _loc7_:int = 0;
         var _loc3_:int = int(this._13721.length);
         while(_loc3_--)
         {
            _loc4_ = this._13721[_loc3_];
            _loc5_ = int(param1[_loc3_]);
            this._2880._13715(_loc4_,_loc5_);
         }
         this._2880._2891();
         _loc3_ = int(this._13719.length);
         while(_loc3_--)
         {
            _loc6_ = this._13719[_loc3_];
            _loc7_ = int(param2[_loc3_]);
            this._2880._13714(_loc6_,_loc7_);
         }
      }
      
      protected function get _13721() : Array
      {
         return _2223._13721;
      }
      
      protected function get _13701() : Array
      {
         return _2223._13701;
      }
      
      protected function get _13720() : Array
      {
         return _2223._13720;
      }
      
      protected function get _13719() : Array
      {
         return _2223._13719;
      }
      
      protected function get _13718() : Array
      {
         return _2223._13718;
      }
      
      protected function get _13717() : Array
      {
         return _2223._13717;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
   }
}


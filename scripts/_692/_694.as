package _692
{
   import _51._50;
   import _703._702;
   import _724._723;
   import _724._725;
   
   public class _694 extends _691
   {
      private var _5838:_695;
      
      public function _694(param1:_50, param2:_695)
      {
         _3670 = new _723(param1);
         super(this._4161);
         this._5838 = param2;
         if(this._5838)
         {
            this._5838.parent = this;
         }
      }
      
      public static function _3996(param1:_702, param2:_50, param3:_695) : _694
      {
         var _loc4_:_694 = new _694(param2,param3);
         if(param1 is _13549 || param1 is _696)
         {
            _loc4_.parentNode = param1;
         }
         else
         {
            _loc4_.parent = param1;
         }
         return _loc4_;
      }
      
      public function open() : void
      {
         if(this._5838)
         {
            this._5822.push(this._5838);
         }
      }
      
      public function close() : void
      {
         this._5822.length = 0;
      }
      
      public function get _4161() : _723
      {
         return _3670 as _723;
      }
      
      public function get _3678() : _695
      {
         return this._5838;
      }
      
      public function set _3678(param1:_695) : void
      {
         var _loc2_:int = 0;
         if(this._5838 != null)
         {
            _loc2_ = int(_5822.indexOf(this._5838));
         }
         this._5838 = param1;
         this._5838.parent = this;
         if(_loc2_ != -1)
         {
            _5822.splice(_loc2_,1);
            _5822.push(this._5838);
         }
      }
      
      public function _5839() : void
      {
         this._4161._5839();
      }
      
      public function _5834() : void
      {
         if(this._5838)
         {
            this._5838._5834();
         }
      }
      
      public function _5832(param1:_725) : _691
      {
         if(this._5838)
         {
            return this._5838._5832(param1);
         }
         return null;
      }
      
      public function get parentNode() : Object
      {
         return _parent;
      }
      
      public function set parentNode(param1:Object) : void
      {
         if(this.parentNode == param1)
         {
            return;
         }
         if(this.parentNode)
         {
            this.parentNode.removeChild(this);
         }
         _parent = param1 as _702;
         if(this.parentNode)
         {
            this.parentNode.addChild(this);
            this.parentNode._5827();
         }
      }
   }
}


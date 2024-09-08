package _14075
{
   import _51._79;
   import _724._725;
   import _81._83;
   import flash.geom.Matrix;
   
   public class _14076
   {
      private var _14666:Object;
      
      public function _14076()
      {
         this._14666 = {};
         super();
      }
      
      public function _14667(param1:_79, param2:_725, param3:Matrix, param4:_83) : void
      {
         var _loc5_:_14074 = null;
         if(param2 != null)
         {
            _loc5_ = this._14665(param1);
            if(_loc5_ == null)
            {
               _loc5_ = new _14074();
            }
            _loc5_._2104 = param2;
            _loc5_.matrix = param3;
            _loc5_.color = param4;
            this._14666[param1.name] = _loc5_;
         }
         else if(this._14666[param1.name])
         {
            delete this._14666[param1.name];
         }
      }
      
      public function _4242(param1:_79, param2:Vector.<Number>, param3:Vector.<int>, param4:Vector.<Number>) : void
      {
         var _loc5_:_14074 = this._14665(param1);
         if(_loc5_ == null)
         {
            _loc5_ = new _14074();
         }
         _loc5_._14663 = param2.concat();
         _loc5_._2709 = param3.concat();
         _loc5_._14664 = param4.concat();
         this._14666[param1.name] = _loc5_;
      }
      
      public function _14665(param1:_79) : _14074
      {
         return this._14666[param1.name] as _14074;
      }
   }
}


<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Car\CheckCarRequest;
use App\Http\Requests\Api\Reviews\StoreReviewRequest;
use App\Http\Requests\Api\Reviews\UpdateReviewRequest;
use App\Http\Resources\PaginationCollection;
use App\Http\Resources\ReviewResource;
use App\Models\Car;
use App\Models\CarPlate;
use App\Models\Review;
use App\Services\ReviewService;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
    private $reviewService;

    public function __construct()
    {
        $this->reviewService = new ReviewService();
    }
    /**
     * Display a listing of the resource.
     */
    public function index(CheckCarRequest $request)
    {
        $reviews = $this->reviewService->getMobileData($request->all());

        return $this->returnAllDataJSON(ReviewResource::collection($reviews), new PaginationCollection($reviews));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreReviewRequest $request)
    {
        $review = $this->reviewService->storeMobileData($request->all());
        return $this->returnJSON(new ReviewResource($review) , true , 200 , __('site.comment_created_successfully'));
    }

    /**
     * Display the specified resource.
     */
    public function show(Review $review)
    {
        return $this->returnJSON(new ReviewResource($review));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Review $review)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateReviewRequest $request, Review $review)
    {
        $user = auth('end-user-api')->user() ?? auth('showroom-api')->user();

        if ($user->reviews->contains($review)){

            $review = $this->reviewService->update( $review, $request->all());
            return $this->returnJSON(new ReviewResource($review) , true , 200 , __('site.comment_updated_successfully'));

        }else{
            return $this->returnWrong(__('site.permission_denied'));
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Review $review)
    {
        // Check if the authenticated user is the owner of the review
        if ($review->user_id === auth('end-user-api')->id()) {
            $review->delete();
            return $this->returnSuccess(__('site.deleted_successfully'));
        } else {
            return $this->returnWrong(__('site.permission_denied'));
        }
    }

    public function reportReview(Review $review)
    {
        $value = $review->reported == '1' ? '0' : '1';
        $message = $review->reported == '1' ? 'The Comment unreported' : 'The Comment is reported';

        $review->update(['reported' => $value]);
        return $this->returnJSON(new ReviewResource($review) , true ,200 , $message);

    }
}
